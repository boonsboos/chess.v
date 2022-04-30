module game

[heap]
struct Tile {
mut:
	col string
	row u8
	piece Piece
	dark_square bool
}

struct Piece {
	kind Kind
	color u8 = 2
}