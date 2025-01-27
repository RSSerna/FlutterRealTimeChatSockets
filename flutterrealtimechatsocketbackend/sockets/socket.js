const { io } = require('../index');
const { checkJWT } = require('../helpers/jwt');
const { userConnected, userDisconnected } = require('../controllers/socket');

//Mensajes por Sockets
io.on('connection', client => {
    console.log('Cliente Conectado');
    //Verify Authentication
    const [isValid, uid] = checkJWT(client.handshake.headers['x-token']);
    if (!isValid) {
        console.log('Desconectando Cliente');
        return client.disconnect();
    }
    //Change Online status
    userConnected(uid);

    client.on('disconnect', () => {
        console.log('Cliente desconectado');
        userDisconnected(uid);
    });
});