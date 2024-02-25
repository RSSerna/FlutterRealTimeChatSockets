const { io } = require('../index');

//Mensajes por Sockets
io.on('connection', client => {
    console.log('Cliente Conectado');
    client.on('disconnect', () => { console.log('Cliente desconectado'); });
});