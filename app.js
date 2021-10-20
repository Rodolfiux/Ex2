const express = require('express');
const app = express(); 
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));
const router=express.Router(); 

const path= require('path');
app.use(express.static(path.join(__dirname, 'public')));

app.use(bodyParser.json());


app.set('view engine', 'ejs');
app.set('views', 'views'); 
const rutasZombies = require('./routes/zombies.js');
app.use('/petz', rutasZombies);
app.get('/', (request, response, next) => {
    response.redirect('/petz');
});


app.use((request, response, next) => {
    console.log('Error 404');
    response.status(404);
    response.send('Lo sentimos esta página no existe!'); 
});

app.listen(3000);