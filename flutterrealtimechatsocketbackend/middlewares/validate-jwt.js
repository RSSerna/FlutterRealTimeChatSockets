const jwt = require('jsonwebtoken');


//Validacion de que no existan errores en la request dado por el Middle
const validateJWT = (req, res, next) => {
    const token = req.header('x-token');
    if (!token) {
        return res.status(401).json({
            ok: false,
            errors: 'No token provided'
        });
    }
    try {
        const { uid } = jwt.verify(token, process.env.JWT_KEY);
        req.uid = uid;
        next();
    } catch (error) {
        return res.status(401).json({
            ok: false,
            errors: 'No token provided'
        });
    }
}

module.exports = {
    validateJWT
}