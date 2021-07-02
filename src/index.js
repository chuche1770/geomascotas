const express = require('express');
const morgan = require('morgan');
//Inicializaciones
const app = express();


/* Settings */
app.set('AppName', 'GeoPets')
app.set('port', process.env.PORT || 3000);
// app.set('view engine', 'ejs')

/* Middlewares */
app.use(express.urlencoded({
    extended: true
}))
app.use(express.json());
app.use(morgan('dev'))

// Routes
app.use(require("./routes/users"))

/* 
app.post('/user/:id', (req, res) => {
    console.log(req.body);
    console.log(req.params);
    res.send("POST REQUEST RECEIVED");
});

app.post('/about', (req, res) => {
    res.send("POST REQUEST RECEIVED");
    console.log(req.body["nombre"]);

});

app.put('/user/:id', (req, res) => {
    console.log(req.body);
    res.send(`User ${req.params.id} updated`);
});
 */


//Starting the Server
app.listen(app.get('port'), () => {
    console.log(app.get('AppName'));
    console.log("Server on port ", app.get('port'));
})

