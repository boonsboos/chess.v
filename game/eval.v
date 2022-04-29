module game

import readline

fn (mut game Game) eval_input() {
	move := readline.read_line('> ') or {''} .all_before('\n')
	// can't be < 2 chars, 5 chars max for castling or ambiguity
	if move.len < 2 || move.len > 5 {
		invalid()
		if move.contains('x') {
			println('the computer will take for you.')
		}
		return
	}

	// check if keywords are present
	match move {
		'exit', 'quit', 'stop' {
			exit(0)
		}
	}

	match move[0] {
		'Q', 'q' {
			eval_queen_move(move[1..])
		}
		'N', 'n' {
			eval_horse_move(move[1..])
		}
		'K', 'k' {
			eval_king_move(move[1..])
		}
		'O', 'o' {
			// we can just check what way to castle by the length
			eval_castle(move.len)
		}
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' {
			eval_pawn_move(move)
		}
		'R', 'r' {
			eval_rook_move(move[1..])
		}
		'B', 'b' {
			eval_bishop_move(move[1..])
		}
	}
}

fn invalid() {
	println('invalid move!')
}

fn eval_queen_move(move string) {
	invalid()
}

fn eval_bishop_move(move string) {
	invalid()
}

fn eval_castle(move int) {
	invalid()
}

fn eval_horse_move(move string) {
	invalid()
}

fn eval_king_move(move string) {
	invalid()
}

fn eval_rook_move(move string) {
	invalid()
}

fn eval_pawn_move(move string) {
	invalid()
}