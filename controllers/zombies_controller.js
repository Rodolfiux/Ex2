
const { json } = require('body-parser');
const Zombie = require('../models/petz');



exports.getNuevoZombie = (request, response, next) => {
   response.render('nuevo_zombie',{title:'Nuevo zombie',
                                    });
   
};


exports.postNuevoZombie =  (request, response, next) => {

    const zombie = new Zombie( request.body.nombre_zombie, request.body.id_estado);

    zombie.save().then(() => {
        response.redirect('/petz');
    }).catch(
        err => { console.log(err)
        response.redirect('/petz/nuevo_zombie');}
   
    );
     
 };
 

exports.get= (request, response, next) => {
       
        Zombie.fetchAllZombie() 
           .then(([rows, fieldData]) => {   
            response.render('petz',
            {
             title: 'Trato de los zombies',
             zombies: rows
            }
                );
            })
            .catch(err => { 
             console.log(err);
            });
        
    
        


};

exports.postBuscar= (request, response, next) => {
    response.status(200).json({message:"Respuesta asincrona"})
};
