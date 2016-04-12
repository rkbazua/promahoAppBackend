var express  = require('express'),
    path     = require('path'),
    bodyParser = require('body-parser'),
    app = express(),
    expressValidator = require('express-validator');

app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: true })); //support x-www-form-urlencoded
app.use(bodyParser.json());
app.use(expressValidator());

var routescan = require('express-routescan');
routescan(app);

var models = require("../models");
//Sync database with sequelize. If it succeeds, start server
models.sequelize.sync().then(function () {
	var server = app.listen(3000,function(){

	   console.log("Listening to port %s",server.address().port);

	});
});

