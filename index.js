const express = require("express")
const connection = require("./database");
const session = require("express-session");
const { convertStringToNumber } = require('convert-string-to-number');
const app = express();
const multer = require("multer");
const pathFile = "http://localhost:3500/uploads/";

const storage = multer.diskStorage({
    destination: (req,file,cb) => {
        cb(null, "uploads")
    },
    filename : (req, file, cb) => {
        console.log(file)
        cb(null, `${file.originalname}` )
    }
})
console.log(storage.originalname)

const upload = multer({storage:storage})

app.use(express.static("public"))
app.use(express.static("uploads"))
app.use(express.urlencoded({extended:false}))
app.set("view engine", "ejs");

app.use(session({
    cookie :{
        maxAge : 2 * 60 * 60 * 1000,
        secure : false,
        httpOnly : true
    },
    store  : new session.MemoryStore(),
    saveUninitialized : true,
    resave : false,
    secret : "secretValue"
}))



//Sistem Login
app.get("/login", (req,res) => {
    res.render("login", {title: "login",isLogin : false, admin : req.session.admin});
})

app.post("/login",(req,res) =>{
   const email = req.body.email;
   const password = req.body.password;

   if ((email === "") || (password === "")){
       req.session.message = {
           type : "danger",
           message : "Please fullfill input"
       }
       res.redirect("/login");
       return;
   }
   else{
       const query = "SELECT * FROM tb_users";
       connection.query(query,(err,results) => {
           if (err) throw err;
           for(let i = 0 ; i < results.length ; i++){
               if((results[i].email == email) && (results[i].password == password) ) {
                   if(results[i].status == 1){
                    req.session.admin = true;
                    console.log("admin true");
                    req.session.message = {
                        type : "success",
                        message : "Login Success"
                    }
                    req.session.isLogin = true;
                    req.session.user_Id = results[i].id;
                    res.redirect("/")
                    return;
                   }
                   else{
                    req.session.admin = false;
                    console.log("admin true");
                    req.session.message = {
                        type : "success",
                        message : "Login Success"
                    }
                    req.session.isLogin = true;
                    req.session.user_Id = results[i].id;
                    res.redirect("/")
                    return;
                   }
                   
                }
               else{
                req.session.message = {
                    type : "danger",
                    message : "Login Fail"
                }
                req.session.isLogin = false;
               }
           }
           res.redirect("/login")          
       })   
   }
  
})



//Sistem Register
app.get("/register", (req,res) => {
    res.render("register", {title: "register",isLogin : false, admin : req.session.admin});
})

app.post("/register", (req,res) =>{
    const nameRegister = req.body.nameRegister;
    const emailRegister = req.body.emailRegister;
    const passwordRegister = req.body.passwordRegister;
    
    if((nameRegister == "") || (emailRegister == "") || (passwordRegister == "")){
        req.session.message = {
            type : "danger",
            message : "Please fullfill register"
        }
        res.redirect("/register");
        return;
    }
    else{
        const query = `INSERT INTO tb_users(email,name,password,status) VALUES ("${emailRegister}", "${nameRegister}", "${passwordRegister}",0)`
            connection.query(query,(err,results)=>{
            if (err) throw err;
            req.session.message = {
                type : "success",
                message : "Data successfully to add"
            }
            console.log("Data successfully to add")
        })
        res.redirect("/login");
    }

})



//Tampilan Index
app.get("/", (req,res) => {
    res.render("index", {title: "Ticket", isLogin : req.session.isLogin, movieShow : false, admin : req.session.admin});
})
app.post("/",(req,res) => {
    const movieGenre = req.body.movieGenre;
    const movieTitle = req.body.movieName;
    if(movieGenre == ""){
        const query = `SELECT*FROM tb_movies WHERE name = "${movieTitle}"`
        connection.query(query, (err,results) => {
            if (err) throw err;
            res.render("index", {title: "Ticket", isLogin : req.session.isLogin, movieShow : true, results : results, admin : req.session.admin})
        })
    }
    else if(movieTitle == ""){
        const queryy = `SELECT * FROM tb_types JOIN tb_movies ON tb_types.name = tb_movies.type_name WHERE tb_types.name = "${movieGenre}"`
        connection.query(queryy, (err,results) => {
            if (err) throw err;
            console.log(results)
            res.render("index", {title: "Ticket", isLogin : req.session.isLogin, movieShow : true, results : results, admin : req.session.admin})
        })
    }
})



//Sistem Payment
app.get("/payment", (req,res) => {
    res.render("payment", {title: "Payment", isLogin : req.session.isLogin, orderMovie : false,clear :false, admin : req.session.admin});
})
app.get("/pesan-payment/:name",(req,res) => {
    const name = req.params.name;
    console.log(name);
    const query = `SELECT * FROM tb_movies JOIN tb_ticket ON tb_movies.name= tb_ticket.movie_name WHERE tb_movies.name = "${name}"`
    connection.query(query, (err,results) => {
      if (err) throw err;
      console.log(results);
      res.render("payment", {title: "Payment", isLogin : req.session.isLogin, orderMovie : true, clear :false, results : results, admin : req.session.admin})
    }) 
  })
app.post("/payment",(req,res)=>{
    const clearMovie = [{
        title : req.body.MovieTitle,
        price :  convertStringToNumber(`${req.body.price}`),
        duration : req.body.duration,
        time : req.body.time,
        amount : convertStringToNumber(`${req.body.amount}`),
        id : convertStringToNumber(`${req.body.ticketId}`),
        subtotal: convertStringToNumber(`${req.body.price}`) * convertStringToNumber(`${req.body.amount}`)  
    }]
    console.log(clearMovie);
    const query = `INSERT INTO tb_payments(amount,sub_total,ticket_name) VALUES (${clearMovie[0].amount}, ${clearMovie[0].subtotal},"${clearMovie[0].title}")`
    connection.query(query,(err,results)=>{
    if (err) throw err;
    req.session.message = {
         type : "success",
         message : "Data successfully to add"
    }
    })

    res.render("payment", {title: "Payment", isLogin : req.session.isLogin, orderMovie : false, clear :true, clearMovie : clearMovie, admin : req.session.admin})
   
})



//Sistem Adding
app.get("/add",(req,res)=>{
    res.render("add", {title: "Add Movie",isLogin : req.session.isLogin , admin : req.session.admin});
})

app.post("/add",upload.single('image') ,(req,res) =>{
    const title = req.body.addTitle;
    const photo = req.file.filename;
    const hour = req.body.addHour;
    const price = req.body.addPrice;
    const venue = req.body.addVenue;
    const movieGenre= req.body.addMovieGenre;
    const date = req.body.addDate;
    const time = req.body.addTime;

    const query = `INSERT INTO tb_movies(name,movie_hour,photo,type_name) VALUES ("${title}", "${hour}","${photo}","${movieGenre}")`
        connection.query(query,(err,results)=>{
        if (err) throw err;
        req.session.message = {
             type : "success",
             message : "Data successfully to add"
        }
         console.log("Data successfully to add")
        })
    const queryy = `INSERT INTO tb_ticket(date_show,time_show,price,venue,movie_name) VALUES ("${date}", "${time}", "${price}","${venue}","${title}")`
        connection.query(queryy,(err,results)=>{
        if (err) throw err;
        req.session.message = {
             type : "success",
             message : "Data successfully to add"
        }
         console.log("Data successfully to add")
        })

    res.redirect("/");
})



//Sistem Edit
app.get("/edit/:id", (req,res) => {
    const id = req.params.id;
    const query = `SELECT * FROM tb_movies WHERE id = ${id}`
    connection.query(query, (err,results) => {
      if (err) throw err;
      console.log(results);
      const data = [ id, results]
      console.log(data);
      res.render("edit", {title: "edit", isLogin : req.session.isLogin, data : data, admin : req.session.admin})
  })
})

app.post("/edit",upload.single('image'),(req,res) =>{
    const title = req.body.addTitle;
    const photo = req.file.filename;
    const hour = req.body.addHour;
    const price = req.body.addPrice;
    const venue = req.body.addVenue;
    const movieGenre= req.body.addMovieGenre;
    const date = req.body.addDate;
    const time = req.body.addTime;
    const id = req.body.id;

    const query = `UPDATE tb_movies SET name = "${title}",movie_hour = "${hour}", photo = "${photo}",type_name = "${movieGenre}"
    WHERE id = ${id}`
        connection.query(query,(err,results)=>{
        if (err) throw err;
        req.session.message = {
             type : "success",
             message : "Data successfully to change"
        }
         console.log("Data successfully to change")
        })
    
    // const queryy = `UPDATE tb_ticket SET date_show = "${date}", time_show = "${time}", price = "${price}", venue = "${venue}", movie_name="${title}" 
    // WHERE id = ${id}`
    //     connection.query(queryy,(err,results)=>{
    //     if (err) throw err;
    //     req.session.message = {
    //          type : "success",
    //          message : "Data successfully to change"
    //     }
    //      console.log("Data successfully to change")
    //     })    
    
     res.redirect("/");
})



//Sistem Delete
app.get("/delete/:id", (req,res) => {
    const id = req.params.id;
    const query = `DELETE FROM tb_movies WHERE id=${id}`;
    connection.query(query, (err,results) => {
      if (err) throw err;
      console.log(results);
     })
     const queryy= `DELETE FROM tb_ticket WHERE id=${id}`;
     connection.query(queryy, (err,results) => {
      if (err) throw err;
      console.log(results);
     })
  res.redirect("/");
})


//List of Payment 
app.get("/list", (req,res) => {
    const query = `SELECT * FROM tb_payments`
    connection.query(query, (err,results) => {
      if (err) throw err;
      console.log(results);
     res.render("list", {title: "List of payment", isLogin : req.session.isLogin, results:results, admin : req.session.admin})
    })
})

//genre
app.get("/genre", (req,res) => {
    const query = `SELECT * FROM tb_types`
    connection.query(query, (err,results) => {
      if (err) throw err;
      console.log(results);
      res.render("genre",{title:"Genre", isLogin: req.session.isLogin, hasil:results, admin : req.session.admin})
    })
})

app.get("/add-genres", (req,res) => {
    res.render("addGenre",{title:"Add-Genre", isLogin: req.session.isLogin, admin : req.session.admin})
})

app.post("/genre-add-success",upload.single('image'),(req,res) => {
    const title = req.body.genreName;
    const photo = req.file.filename;

    const query = `INSERT INTO tb_types(name,photo) VALUES ("${title}","${photo}")`;
    connection.query(query,(err,results) => {
      if (err) throw err;
      console.log(results);
    })
    res.redirect("/genre")
})

app.get("/delete-genres/:id",(req,res) => {
    const id = req.params.id;
    const query = `DELETE FROM tb_types WHERE id=${id}`;
    connection.query(query, (err,results) => {
      if (err) throw err;
      console.log(results);
     })
     res.redirect("/genre");
})

app.get("/edit-genres/:id",(req,res)=> {
    const id = req.params.id;
    const query = `SELECT * FROM tb_types WHERE id = ${id}`;
    connection.query(query, (err,results) => {
        if (err) throw err;
        console.log(results);
        res.render("editGenre",{title:"Genre", isLogin: req.session.isLogin, hasil:results, admin : req.session.admin})
       })
})

app.post("/genre-edit-success",upload.single('image'),(req,res) => {
    const title = req.body.genreName;
    const photo = req.file.filename;
    const id = req.body.id;

    const query = `UPDATE tb_types SET name = "${title}", photo = "${photo}" WHERE id = ${id} `;
    connection.query(query,(err,results) => {
      if (err) throw err;
      console.log(results);
    })
    res.redirect("/genre")
})



const port = 3500;
app.listen(port, () => {
    console.log("server running on port: "+port)
})