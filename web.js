var connect = require('connect');

var port = process.env.PORT || 5000;

var app = connect()
	.use(connect.logger('dev'))
	.use(connect.static('public', {maxAge: 7 * 24 * 3600 * 1000 }))
	.use(connect.staticCache())
	.listen(port);
