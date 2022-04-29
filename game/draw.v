module game

import term

fn (mut game Game) draw_board() {

	mut board := ''
	mut temp := ''
	mut i := 8

	for tiles in game.board {
		temp = ''
		for tile in tiles {
			if !tile.dark_square {
				temp += term.bold(term.bg_white(term.black('${kind_to_string(tile.piece.kind, tile.piece.color)} '))) + term.reset('')
			} else {
				temp += term.bold(term.bg_black('${kind_to_string(tile.piece.kind, tile.piece.color)} ')) + term.reset('')
			}
		}

		board += temp + ' | $i\n'
		i--
	}

	println(board + 'a b c d e f g h\n')
}

fn kind_to_string(kind Kind, col u8) string {
	if col == 1 {
		// white
		return match kind {
			.empty { ' ' }
			.pawn { '♙' }
			.horse { '♘' }
			.d_bishop, .bishop { '♗' }
			.rook { '♖' }
			.queen { '♕' }
			.king { '♔' }
		}
	} else {
		// black
		return match kind {
			.empty { ' ' }
			.pawn { '♟' }
			.horse { '♞' }
			.d_bishop, .bishop { '♝' }
			.rook { '♜' }
			.queen { '♛' }
			.king { '♚' }
		}
	}
}