'use strict';

var models  = require('../models');

module.exports = {

    '/': function(req, res){
        res.send("It's main page of my app.");
    },
	
	'/promahosbjj/queryCintas': {
        methods: ['get'],
        fn: queryCintas
    }

};

function queryCintas(req,res){
	models.bjj_cinta.findAll().then(function(cintas) {
		console.log("Cintas: "+cintas);
		  res.status(200).send('index',{
		  cinta: cintas
		});
	});
}