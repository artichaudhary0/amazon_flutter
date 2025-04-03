const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: function (value) {
                const reg = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
                return reg.test(value);
            },
            message: "Please enter a valid email address",
        },
    },
    password: {
        required: true,
        type: String,
        validate: {
            validator: function (value) {
                return value.length >= 8;
            },
            message: "Please enter a long password",
        },
    },
    address: {
        type: String,
        default: "",
    },
    type: {
        type: String,
        enum: ["admin", "user"],
        default: "user",
    },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
