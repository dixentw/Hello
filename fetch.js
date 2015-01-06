
var https = require('https');

var headers = {
	Cookie : 'over18=1'
};
var options = {
	hostname : 'www.ptt.cc',
	port : 443,
	headers : headers,
	path : '/bbs/Gossiping/M.1419999715.A.373.html',
	//path : '/ask/over18?from=%2Fbbs%2FGossiping%2FM.1419999715.A.373.html',
	method : 'GET'
};

var req = https.request(options, function(res){
	console.log('STATUS : ' + res.statusCode);
	console.log('HEADER : ' + JSON.stringify(res.headers));
	res.setEncoding('utf8');
	res.on('data', function(chunk){
		console.log('BODY : '+ chunk);
	});
});

req.end();
