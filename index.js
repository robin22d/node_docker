var express = require('express');

var app = express();

app.get('/', function(req, res){
	res.send('Hello World!!');
});

app.listen(9000, function(){
	console.log('App listing on port 9000');
});