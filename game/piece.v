module game

type Piece = Empty | ChessPiece

struct Empty {}

struct ChessPiece {
	kind Kind
	color u8
	dark_square bool
}