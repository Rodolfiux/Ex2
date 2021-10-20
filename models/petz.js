
const db = require('../util/database');



module.exports = class Zombie {

    constructor(nombre_zombie, id_estado) {

        this.nombre_zombie = nombre_zombie,
        this.id_estado = id_estado

    }

     
    save() {
        
        return db.execute('INSERT INTO zombie_estado (nombre_zombie, id_estado) VALUES (?,?)',
            [this.nombre_zombie, this.id_estado]
        );

    }

    static fetchAllZombie() {
         return db.execute('SELECT  zombie_estado.nombre_zombie, zombie_estado.fecha, estado.tipo_estado FROM zombie_estado INNER JOIN estado ON zombie_estado.id_estado = estado.id_estado ' );
        
    }
    

}