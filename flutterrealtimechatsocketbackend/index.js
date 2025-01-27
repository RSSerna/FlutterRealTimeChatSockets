const path = require('path');
const express = require('express');
require('dotenv').config();

//DB Config
// const { dbConnection } = require('./database/config');
// dbConnection();
require('./database/config').dbConnection();

//App de Express
const app = express();

//Lectura y parseo del Body
app.use(express.json());

//Node Server
const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);

//Inicializar socket desde el archivo
require('./sockets/socket');

//Path Publico
const publicPath = path.resolve(__dirname, 'public');
app.use(express.static(publicPath));


//Mis Rutas
app.use('/api/login', require('./routes/auth'));
app.use('/api/users', require('./routes/users'));

server.listen(process.env.PORT, (err) => {
    if (err) throw new Error(err);
    console.log('Servidor corriendo en puerto', process.env.PORT);
});