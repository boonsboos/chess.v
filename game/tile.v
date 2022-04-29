module game

struct Tile {
mut:
	piece Piece
	dark_square bool
}

struct Piece {
	kind Kind
	color u8
}