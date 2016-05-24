require('basscss/css/basscss.css');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

Elm.Main.embed(mountNode);
