const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123',
    database: 'geomascotas'
});

mysqlConnection.connect(function (err) {
    if (err) {
        console.log("Ocurrio un Error en la BD", err);
        return
    } else {
        console.log('DB is connected');
    }
});

module.exports = mysqlConnection;