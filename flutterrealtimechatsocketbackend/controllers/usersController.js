const { response } = require("express");
const userModel = require("../models/user_model");

const getUsers = async (req, res = response) => {

    const from = Number(req.query.from) || 0;

    const users = await userModel.find(
        //Obtener Usuarios excepto el que hizo la peticion
        { _id: { $ne: req.uid } }
    ).sort('-online').skip(from).limit(20);

    res.json({
        ok: true,
        users,
        from
    })
}

module.exports = {
    getUsers
}