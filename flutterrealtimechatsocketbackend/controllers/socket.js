const userModel = require("../models/user_model")

const userConnected = async (uid = '') => {
    const user = userModel.findById(uid);
    user.online = true;
    await user.save();
    return user;

}
const userDisconnected = async (uid = '') => {
    const user = userModel.findById(uid);
    user.online = false;
    await user.save();
    return user;

}

module.exports = {
    userConnected,
    userDisconnected
}