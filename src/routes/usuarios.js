const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');
module.exports = router;

router.post('/login', (req, res) => {
    const { numUsuario, pin } = req.body;
    const sql = "SELECT id, nombre, correo, telefonoPersonal FROM USUARIOS WHERE telefonoPersonal LIKE BINARY ? AND pin LIKE BINARY ?;";
    mysqlConnection.query(sql, [numUsuario, pin], (err, rows, fields) => {
        if (!err) {
            !(rows.length === 0) ? res.json(rows[0]) : res.json({ Status: "telefono y/o pin incorrectos" });
        } else {
            console.log(err);
        }
    });
});

router.get('/registro', (req, res) => {
    const query = "SELECT * FROM PREGUNTAS_SECRETAS";
    mysqlConnection.query(query, (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

router.post('/registro', (req, res) => {
    const insertReg = 0;
    const { name, email, phone, pin, answerSQ, idSQ } = req.body;
    // console.log(req.body);
    const query = `
        CALL USUARIOS(?,?,?,?,?,?,?);
    `;
    mysqlConnection.query(query, [insertReg, name, email, phone, pin, answerSQ, idSQ], (err, rows, fields) => {
        if (!err) {
            res.json({ Status: "Usuario Registrado Exitosamente" });
        } else {
            console.log("Ocirrio un error al intentar registar el usuario: ", err);
        }
    });
})