const multer = require("multer");

module.exports = (image) => {
    const storage = multer.diskStorage({
        destination: (req,file,cb) => {
            cb(null, "uploads")
        },
        filename : (req, file, cb) => {
            console.log(file)
            cb(null, `${Date.now()}-${file.originalname}` )
        }
    })

    const fileFilter = function(req, file, cb){
        if(file.fieldname === image){
            if(!file.originalname.match(/\.(jpg || JPG || png || PNG || jpeg || JPEG)$/)){
                req.fileValidationError = {
                    message : "Only image file allowed"
                }
             return cb(new Error("Only image file allowed", false))
            }
        }
        cb(null,true)
    }
    const sizeMB = 10
    const maxSize= sizeMB * 1024 * 1024

    const upload = multer({
        storage,
        fileFilter,
        limits : {
            fileSize : maxSize,
        },
    }).single(image)

    return (req, res, next) => {
        upload(req, res, function(err){
            if(err){
                if(err.code == "LIMIT_FILE_SIZE"){
                    req.session.message = {
                        type : "danger",
                        message : "Error, max file is 10 MB"
                    }
                    return res.redirect(req.originalUrl)
                }
                // req.session.message = {
                //     type : "danger",
                //     message : "Upload file error"
                // }
                // return res.redirect(req.originalUrl)
            }
            return next()
        })
    }
}