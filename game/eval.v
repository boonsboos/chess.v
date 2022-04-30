module game

import time
import readline

fn (mut game Game) eval_input() {
	move := readline.read_line('> ') or {''} .all_before('\n').strip_margin()
	// can't be < 4, 5 chars max
	// move notation MUST specify where the piece came from
	// eg Qe1d2
	// it does not matter whether there is only one of said piece on the field
	if move.len < 4 || move.len > 5 {
		invalid()
		if move.contains('x') {
			println('the computer will take for you.')
			time.sleep(5 * time.second)
		}
		return
	}

	match move[0].ascii_str() {
		'!' {
			exec_command(move[1..]) // command.v
		}
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
			game.eval_pawn_move(move)
		}
		'R', 'r' {
			eval_rook_move(move[1..])
		}
		'B' {
			eval_bishop_move(move[1..])
		}
		else {
			invalid()
		}
	}
}

fn invalid() {
	println('invalid move!')
	time.sleep(2 * time.second)
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

fn (mut game Game) eval_pawn_move(move string) {
	println(move)
	col_f := move[0].ascii_str()
	row_f := move[1].ascii_str().u8()
	col_t := move[2].ascii_str()
	row_t := move[3].ascii_str().u8()

	// black pawn
 	if game.turn == 0 {

		if row_f == 7 && row_f - row_t <= 2 {

			mut tile_f := game.find_tile(col_f, row_f)
			mut tile_t := game.find_tile(col_t, row_t)
			if tile_f.row == 0 || tile_t.row == 0 { invalid() }
			if has_piece(tile_t) { invalid() }

			tile_t.piece = tile_f.piece
			tile_f.piece = Piece{}

		} else if row_f - row_t == 1 {

			mut tile_f := game.find_tile(col_f, row_f)
			mut tile_t := game.find_tile(col_t, row_t)
			if tile_f.row == 0 || tile_t.row == 0 { return }

			if has_piece(tile_t) { return }

			tile_t.piece = tile_f.piece
			tile_f.piece = Piece{}
			
		} else {
			invalid()
		}

		game.turn++
		game.turns[0]++
		return

	}
	
	// white pawn
	if row_f == 2 && row_t - row_f <= 2 {

		mut tile_f := game.find_tile(col_f, row_f)
		mut tile_t := game.find_tile(col_t, row_t)
		if tile_f.row == 0 || tile_t.row == 0 { return }

		if has_piece(tile_t) { return }

		tile_t.piece = tile_f.piece
		tile_f.piece = Piece{}
		println(tile_t)
		println(tile_f)
		time.sleep(5*time.second)

	} else if row_t - row_f == 1 {

		mut tile_f := game.find_tile(col_f, row_f)
		mut tile_t := game.find_tile(col_t, row_t)
		if tile_f.row == 0 || tile_t.row == 0 { return }

		if has_piece(tile_t) { return }

		tile_t.piece = tile_f.piece
		tile_f.piece = Piece{}

	} else {
		invalid()
	}

	game.turn--
	game.turns[1]++

}