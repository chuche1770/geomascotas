const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');
module.exports = router;

router.post('/login', (req, res) => {
    const { telefonoPersonal, pin } = req.body;
    const sql = "SELECT id, nombre, correo, telefonoPersonal FROM USUARIOS WHERE telefonoPersonal LIKE BINARY ? AND pin LIKE BINARY ?;";
    mysqlConnection.query(sql, [telefonoPersonal, pin], (err, rows, fields) => {
        if (!err) {
            !(rows.length === 0) ? res.json({ Status: "ok", data: rows[0] }) : res.json({ Status: "TELEFONO Y/O PIN INCORRECTOS" });
        } else {
            console.log(err);
        }
    });
});

router.get('/registro', (req, res) => {
    const query = "SELECT * FROM PREGUNTAS_SECRETAS";
    mysqlConnection.query(query, (err, rows, fields) => {
        if (!err) {
            res.json({ Status: "ok", rows });
        } else {
            console.log(err);
        }
    });
});

router.post('/registro', (req, res) => {
    const insertReg = 0;
    const { nombre, correo, telefonoPersonal, pin, respuestaPreguntaSecreta, PREGUNTAS_SECRETAS_ID } = req.body;
    const query = `
        CALL USUARIOS(?,?,?,?,?,?,?);
    `;
    mysqlConnection.query(query, [insertReg, nombre, correo, telefonoPersonal, pin, respuestaPreguntaSecreta, PREGUNTAS_SECRETAS_ID], (err, rows, fields) => {
        if (!err) {
            res.json({ Status: "ok" });
        } else {
            console.log("Ocirrio un error al intentar registar el usuario: ", err);
        }
    });
})