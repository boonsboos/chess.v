module option

import os

pub struct Options {
pub:
	server string
}

struct Options2 {
mut:
	server	string
}

pub fn populate() Options {
	mut args := os.args[1..]
	mut options := Options2{}

	for args.len > 0 {
		match args[0] {
			'-s', '--server' {
				if args.len == 1 { parse_err(args[0]) }
				args = shift(args)
				options.server = args[0]
				args = shift(args)
			}
			else { unknown_opt(args[0]) }
		}
	}

	return transfer_settings(options)
}

[noreturn]
fn unknown_opt(option string) {
	eprintln('unrecognized option `$option`')
	exit(1)
}

[noreturn]
fn parse_err(option string) {
	eprintln('no value supplied for option `$option`')
	exit(1)
}

fn shift(args []string) []string {
	return args[1..]
}

fn transfer_settings(opt2 Options2) Options {
	return Options {
		server: opt2.server
	}
} 