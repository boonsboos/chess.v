module game

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

struct Game {
mut:
	// NOTE: [] is vert, [][] is hor
	// [0][0] == a8, [7][7] == h1
	board [][]Tile
}

pub fn start() {
	mut game := Game{}
	game.populate_board()
	game.draw_board()
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
	game.board[0][5].piece = Piece{.bishop, 0}

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
				if j % 2 == 1{
					tile.dark_square = true
				}
			}
			continue // skip writing else, just looks better
		}

		// odd rows start with dark squares
		for j, mut tile in tiles {
			if j % 2 == 0 {
				tile.dark_square = true	
			}
		}
	}

}