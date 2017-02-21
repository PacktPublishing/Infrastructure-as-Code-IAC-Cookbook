#!/usr/bin/env node
var os = require("os");
var redis = require('redis');
var client = redis.createClient(6379, '10.30.0.11');
client.on('connect', function() {
    console.log('connected to redis on '+os.hostname()+' 10.30.0.11:6379');
});

var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Running on '+os.hostname()+'\n');
}).listen(8080);
console.log('HTTP server listening on :8080');
