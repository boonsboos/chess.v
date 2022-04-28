module game

enum Kind {
	empty = 0
	pawn = 1
	horse = 2
	bishop = 3
	rook = 4
	queen = 5
	king = 6
}

struct Game {
mut:
	// NOTE: [] is vert, [][] is hor
	pieces [][]Piece
}

pub fn start() {
	mut game := Game{}
	populate(mut game)
}

fn populate(mut game Game) {
	
	game.pieces = [][]Piece{len: 8}
	
	for mut i in game.pieces {
		i = []Piece{len: 8, init: Empty{} }
	}

	// pawns
	for i in [1, 6] {
		for j in 0..8 {
			game.pieces[i][j] = ChessPiece{kind: .pawn}
		}
	}

	// white pieces
	for j in [0, 7] {
		game.pieces[0][j] = ChessPiece{kind: .rook, color: 1}
	}

	for j in [1, 6] {
		game.pieces[0][j] = ChessPiece{kind: .horse, color: 1}
	}

	game.pieces[0][2] = ChessPiece{.bishop, 1, true}
	game.pieces[0][5] = ChessPiece{.bishop, 1, false}

	game.pieces[0][3] = ChessPiece{kind: .queen, color: 1}
	game.pieces[0][4] = ChessPiece{kind: .king, color: 1}

	// black pieces
	for j in [0, 7] {
		game.pieces[7][j] = ChessPiece{kind: .rook, color: 0}
	}

	for j in [1, 6] {
		game.pieces[7][j] = ChessPiece{kind: .horse, color: 0}
	}

	game.pieces[7][2] = ChessPiece{.bishop, 0, false}
	game.pieces[7][5] = ChessPiece{.bishop, 0, true}
	
	game.pieces[7][3] = ChessPiece{kind: .queen, color: 0}
	game.pieces[7][4] = ChessPiece{kind: .king, color: 0}

	println(game.pieces)

}