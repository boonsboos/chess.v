module network

import net

const port_str = ':38555'
const port = 3855

pub fn test_connect() {
	conn := net.dial_tcp(options.server + ':$port') or { panic('failed to connect to server $options.server, try again later') }
	dump(conn)
}