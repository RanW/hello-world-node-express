var express = require('express');
var app = express();
var redis = require('redis');
redisClient = redis.createClient('6379', 'redis');

// Routes
app.get('/', function(req, res) {
  res.send('Hello World!');
});

app.get('/set', function(req, res) {
  var key = req.query.key;
  var value = req.query.value;
  redisClient.set('hello_world:' + key, value);
  res.send('Key saved:' + key);
});

app.get('/get', function(req, res) {
  var key = req.query.key
  redisClient.get('hello_world:' + key , function(error, result) {
    if (result) {
    	res.send('Value found:' + result);
    } else {
	res.send('Key not found');
    }
  });
});


// Listen
var port = process.env.PORT || 3000;
app.listen(port);
console.log('Listening on localhost:'+ port);
