module main

import game
import option
import network

__global options = option.Options{}

fn init() {
	options = option.populate()
}

fn main() {
	//network.test_connect()
	game.start()
}