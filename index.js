var express = require('express');
var dash = require('appmetrics-dash');
dash.attach();
var app = express();

app.get('/', function(req, res){
	res.send('Hello World!');
});

app.get('/hello', function(req, res){
	res.send('Hello World...again!!');
});

app.listen(9000, function(){
	console.log('App listing on port 9000');
});
