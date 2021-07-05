const express = require('express');
const morgan = require('morgan');
const colors = require('colors');
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
app.use(require("./src/routes/usuarios"));
app.use(require("./src/routes/pets"))

//Starting the Server
app.listen(app.get('port'), () => {
    console.log(app.get('AppName').brightBlue);
    console.log("Server on port: ".brightBlue, app.get('port'));
})

