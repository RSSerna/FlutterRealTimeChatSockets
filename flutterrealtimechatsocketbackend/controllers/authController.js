const { response } = require('express');
const bcrypt = require('bcryptjs');
const User = require('../models/user_model');
const { generateJwt } = require('../helpers/jwt');

const createUser = async (req, res = response) => {

    const { email, password } = req.body;

    try {
        //Fijarse si el Email ya existe
        const emailExist = await User.findOne({ email });
        if (emailExist) return res.status(400).json({ ok: false, msg: 'Not valid Email' });

        //Creacion del User
        const user = new User(
            req.body
        );

        //Encrypt Password
        const salt = bcrypt.genSaltSync();
        user.password = bcrypt.hashSync(password, salt);

        //Guardar el User en la BD
        await user.save();

        //Generar JsonWebToken
        const token = await generateJwt(user.id);

        //Respuesta del BackEnd
        res.json({
            ok: true,
            user,
            token
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Speak to admin'
        });
    }
}
const loginUser = async (req, res = response) => {

    const { email, password } = req.body;

    try {
        //Fijarse si el Email ya existe
        const userDB = await User.findOne({ email });
        if (!userDB) return res.status(400).json({ ok: false, msg: 'Error in LogIn' });

        //Validar Password
        const validPassword = bcrypt.compareSync(password, userDB.password);
        if (!validPassword) return res.status(400).json({ ok: false, msg: 'Password is not Correct' });

        //Generar JsonWebToken
        const token = await generateJwt(userDB.id);

        //Respuesta del BackEnd
        res.json({
            ok: true,
            userDB,
            token
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Speak to admin'
        });
    }
}
const renewToken = async (req, res = response) => {

    // const { uid } = req.body;
    const uid = req.uid;

    try {
        //Generar JsonWebToken
        const token = await generateJwt(uid);

        //Obtener User por UID
        const userDB = await User.findById(uid);

        //Respuesta del BackEnd
        res.json({
            ok: true,
            userDB,
            token
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            ok: false,
            msg: 'Speak to admin'
        });
    }
}

module.exports = {
    createUser,
    loginUser,
    renewToken,
}