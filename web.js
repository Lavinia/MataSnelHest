var connect = require('connect');

var port = process.env.port || 5000;

var app = connect()
	.use(connect.logger('dev'))
	.use(connect.static('public'))
	.listen(port);
