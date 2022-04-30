module game

const cols = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
const rows = [u8(8), 7, 6, 5, 4, 3, 2, 1]

enum Kind {
	empty = 0
	pawn = 1
	horse = 2
	d_bishop = 3 // dark square bishop
	bishop = 4
	rook = 5
	queen = 6
	king = 7
}

[heap]
struct Game {
mut:
	// NOTE: [] is vert, [][] is hor
	// [0][0] == a8, [7][7] == h1
	board [][]Tile
	// 0 = black, 1 is white
	turns map[u8]int
	turn u8 = 1
}

pub fn start() {
	mut game := Game{}
	game.populate_board()

	for {
		game.draw_board() // draw.v
		game.eval_input() // eval.v
	}
}

fn (mut game Game) populate_board() {
	
	game.board = [][]Tile{len: 8, init: []Tile{len: 8} }

	// pawns
	for j in 0..8 {
		game.board[1][j].piece = Piece{.pawn, 0} // black pawns
		game.board[6][j].piece = Piece{.pawn, 1} // white pawns
	}

	// black pieces
	for j in [0, 7] {
		game.board[0][j].piece = Piece{.rook, 0}
	}

	for j in [1, 6] {
		game.board[0][j].piece = Piece{.horse, 0}
	}

	game.board[0][2].piece = Piece{.bishop, 0}
	game.board[0][5].piece = Piece{.d_bishop, 0}

	game.board[0][3].piece = Piece{.queen, 0}
	game.board[0][4].piece = Piece{.king, 0}

	// white pieces
	for j in [0, 7] {
		game.board[7][j].piece = Piece{.rook, 1}
	}

	for j in [1, 6] {
		game.board[7][j].piece = Piece{.horse, 1}
	}

	game.board[7][2].piece = Piece{.bishop, 1}
	game.board[7][5].piece = Piece{.d_bishop, 1}
	
	game.board[7][3].piece = Piece{.queen, 1}
	game.board[7][4].piece = Piece{.king, 1}

	
	// set tile colors
	for i, mut tiles in game.board {
		// even rows start with white squares
		if i % 2 == 1 {
			for j, mut tile in tiles {
				// coordinates
				tile.row = rows[i]
				tile.col = cols[j]

				if j % 2 == 1 {
					tile.dark_square = true
				}
			}
			continue // skip writing else, just looks better
		}

		// odd rows start with dark squares
		for j, mut tile in tiles {

			// coordinates
			tile.row = rows[i]
			tile.col = cols[j]

			if j % 2 == 0 {
				tile.dark_square = true
			}
		}
	}

}

fn (game Game) find_tile(col string, row u8) Tile {
	i, j := game.search_tile(col, row)
	if i > 7 || j > 7 { return Tile{} }
	
	return game.board[i][j]
}

fn (game Game) search_tile(col string, row u8) (int, int) {
	if col !in cols || row !in rows { return 8, 8 }

	for i, tiles in game.board {
		for j, tile in tiles {
			if tile.col == col && tile.row == row { return i, j }
		}
	}

	return 8, 8
}

[inline]
fn has_piece(t Tile) bool {
	return t.piece.kind != .empty
}