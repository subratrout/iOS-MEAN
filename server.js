var express = require('express');
var path = require('path');
var app = express();
var bodyParser = require('body-parser');

app.use(express.static(path.join(__dirname, './static')));
app.use(bodyParser.urlencoded({extended: true}));
app.set('views', path.join(__dirname, './views'));
app.set('view engine', 'ejs');

app.get('/', function(req, res) {
 res.render('index');
});

var server = app.listen(6789, function() {
 console.log('listening on port 6789');
});

var io = require('socket.io').listen(server);

io.sockets.on('connection', function (socket) {
  console.log('SERVER::WE ARE USING SOCKETS!');
  console.log(socket.id);

   socket.on("javascript", function(data) {
       console.log(data);
       socket.broadcast.emit("update_javascript",data);
   });
   socket.on("swift", function(data) {
       console.log(data);
       socket.broadcast.emit("update_swift", data);
   });


   // socket.on("javascript_counter", function(data) {
   //     console.log("an increase in vote for javascript");
   //     socket.broadcast.emit("update_javascript_counter");
   // });
   // socket.on("swift_counter", function(data) {
   //     console.log("an increase in vote for swift");
   //     socket.broadcast.emit("update_swift_counter");
   // });

});

