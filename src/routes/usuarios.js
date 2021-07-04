const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');
module.exports = router;

router.post('/login', (req, res) => {
    const { numUsuario, pin } = req.body;
    const sql = "SELECT id, nombre, correo, telefonoPersonal FROM USUARIOS WHERE telefonoPersonal LIKE BINARY ? AND pin LIKE BINARY ?;";
    mysqlConnection.query(sql, [numUsuario, pin], (err, rows, fields) => {
        if (!err) {
            !(rows.length === 0) ? res.json(rows[0]) : res.json({ Status: "Usuario y/o contraseña incorrectos" });
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
    // const { xd }
})

// router.get('/:id', (req, res) => {
//     const { id } = req.params
//     console.log(id);
//     mysqlConnection.query("SELECT*FROM registro_usuarios WHERE id=?", [id], (err, rows, fields) => {
//         if (!err) {
//             res.json(rows[0]);
//         } else {
//             console.log(err);
//         }
//     })
// });