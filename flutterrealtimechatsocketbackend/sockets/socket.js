const { io } = require('../index');

//Mensajes por Sockets
io.on('connection', client => {
    console.log('Cliente Conectado');
    console.log(client.handshake.headers['x-token']);
    console.log(client.handshake.headers);
    
    client.on('disconnect', () => { console.log('Cliente desconectado'); });
});