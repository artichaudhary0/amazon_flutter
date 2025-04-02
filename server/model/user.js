const mongoose = require("mongoose")

const userSchema = new mongoose.Schema({

        name : {
            require : true
            type : String,
            trim : true,
        }),
        email : {
             require : true,
            type : String,
            trim : true,
            validate : {
            validator : (value) {
                reg =   /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/

                return value.match(reg)
            },
            match : "Please enter a valid email address"

            }
        }),
        password : {
                    require : true,
                    type : String,
                }),
        address : {
            type : string ,
            default : "",
        },

        type : {
            type : String,
//            enum : ["admin","user"],
            default : "user"
        },
}

const User = mongoose.model("User",userSchema)
module.exports = User