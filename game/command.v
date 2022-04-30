module game

fn exec_command(command string) {
	match command {
		'exit', 'quit', 'stop' {
			exit(0)
		}

		else {}
	}
}