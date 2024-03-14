const { io } = require('../index');
const { checkJWT } = require('../helpers/jwt');

//Mensajes por Sockets
io.on('connection', client => {
    console.log('Cliente Conectado');
    const [isValid, uid] = checkJWT(client.handshake.headers['x-token']);

    if (!isValid) {
        console.log('Desconectando Cliente');
        return client.disconnect();
    }

    client.on('disconnect', () => { console.log('Cliente desconectado'); });
});