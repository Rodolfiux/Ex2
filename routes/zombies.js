const express = require('express');
const router = express.Router();
const path= require('path');

const zombies_controller=require('../controllers/zombies_controller');

router.get('/nuevo_zombie',zombies_controller.getNuevoZombie);  

router.post('/nuevo_zombie',zombies_controller.postNuevoZombie);

router.get('/',zombies_controller.get );


router.post('/buscar', zombies_controller.postBuscar);


module.exports = router;