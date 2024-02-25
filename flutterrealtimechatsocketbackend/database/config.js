const mongoose = require('mongoose');

const dbConnection = async () => {
    try {
        //Iniciar la conexion con la Base de datos atraves de Mongoose usando el env file
        await mongoose.connect(process.env.DB_CNN);
        console.log('init db config')

    } catch (error) {
        console.log(error);
        throw new Error('Error en la base de datos hable con el admin');
    }
}

module.exports = {
    dbConnection
}