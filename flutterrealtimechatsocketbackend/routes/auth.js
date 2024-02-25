/*
    path: api/login
*/

const { Router } = require('express');
const { check } = require('express-validator');
const { createUser, loginUser, renewToken } = require('../controllers/authController');
const { validateFields } = require('../middlewares/validate-fields');
const { validateJWT } = require('../middlewares/validate-jwt');

const router = Router();
const name = 'name'
const email = 'email'
const password = 'password'

/*
    Con el path /api/login/new se checkea con el middleware de expressvalidator la informacion necesaria dentro del request
*/

router.post('/new', [
    check(name, name + ' is required').not().isEmpty(),
    check(email, email + ' is required').notEmpty(),
    check(email, email + ' not valid email').isEmail(),
    check(password, password + ' is required').not().isEmpty(),
    check(password, password + ' has less than 6 characters').isLength({ min: 6 }),
    validateFields
], createUser);


router.post('/', [
    check(email, email + ' not valid email').isEmail(),
    check(password, password + ' is required').not().isEmpty(),
    check(password, password + ' has less than 6 characters').isLength({ min: 6 }),
    validateFields
], loginUser);

router.get('/renew', validateJWT, renewToken);


module.exports = router;