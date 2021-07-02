const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');
module.exports = router;

router.post('/login', (req, res) => {
    const { usuario, pin } = req.body;
    sql = "SELECT*FROM registro_usuarios WHERE Correo=? AND Pin=?";
    if (userValidator(req.body.usuario, req.body.pin)) {
        mysqlConnection.query(sql, [usuario, pin], (err, rows, fields) => {
            if (!err) {
                console.log("Numero de elemnetos del arreglo: ", rows.length);
                !(rows.length === 0) ? res.json(rows[0]) : res.json({ Status: "Usuario y/o contraseña incorrectos" });
            } else {
                console.log(err);
            }
        });
    } else {
        res.send({ Status: "Escribe el nombre y contraseña" })
    }
});

function userValidator(email, pin) {
    if (email == undefined || pin == undefined) {
        return false;
    }
    if (email == '' || pin == '') {
        return false;
    }
    return true;
}

router.get('/', (req, res) => {
    mysqlConnection.query('SELECT*FROM registro_usuarios', (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

router.get('/:id', (req, res) => {
    const { id } = req.params
    console.log(id);
    mysqlConnection.query("SELECT*FROM registro_usuarios WHERE id=?", [id], (err, rows, fields) => {
        if (!err) {
            res.json(rows[0]);
        } else {
            console.log(err);
        }
    })
});