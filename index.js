const express = require('express')
const hbs = require('hbs');
const wax = require('wax-on');
const mysql2 = require('mysql2/promise');  // to use await/async, we must
require('dotenv').config();                                     // use the promise version o f mysql2


const app = express();
app.set('view engine', 'hbs');
wax.on(hbs.handlebars);
wax.setLayoutPath('./views/layouts')


async function main() {
    const connection = await mysql2.createConnection({
        'host': process.env.DB_HOST,  // host -> ip address of the database server
        'user': process.env.DB_USER,
        'database': process.env.DB_DATABASE,
        'password': process.env.DB_PASSWORD
    })



    app.get('/actors',async function(req,res){

     const [actors] =  await connection.execute("SELECT * FROM actor");
     res.render('actors.hbs',{
        'actors': actors
    })
})

//     app.get('/staff',async function(req,res){

//         const [staff] =  await connection.execute("SELECT * FROM staff");
//         res.render('staff.hbs',{
//            staff
//        })
// })

app.get('/search', async function(req,res){

    // define the 'get all results query'
    let query = "SELECT * from actor WHERE 1";
    let bindings = []

    // if req.query.first_name is not falsely
    // remember -- undefined, null, empty string, 0 ==> falsely
    if (req.query.first_name) {
        query += ` AND first_name LIKE?'`
        bindings.push('%' + req.query.first_name + '%')
    }
// replacement on sql server
    // if the last name is provided, then add it as part of the search
    if (req.query.last_name) {
        query += ` AND last_name LIKE?'`
        bindings.push( '%' + req.query.last_name + '%')
    }

    console.log(query, bindings);
    let [actors] = await connection.execute(query);

    res.render('search',{
        'actors':actors
    })

})
}
    

main();

// enable using forms
app.use(express.urlencoded({
    'extended': false
}))

app.listen(3000, function(){
    console.log("server has started")
})