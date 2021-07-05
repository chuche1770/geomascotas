const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');
module.exports = router;


router.get('/listadoMascotas', (req, res) => {
    const { id } = req.body;
    const query = "SELECT M.id, M.nombre, E.especie FROM MASCOTAS M JOIN ESPECIES E on M.ESPECIES_id = E.id WHERE M.USUARIOS_id = ?;";
    mysqlConnection.query(query, [id], (err, rows, fields) => {
        if (!err) {
            !(rows.length === 0) ? res.json({ Status: "ok", rows }) : res.json({ Status: "No hay ninguna mascota registrada" });
        } else {
            console.log(err);
        }
    });
});


router.get('/listadoEspecies', (req, res) => {
    const query = "SELECT * FROM ESPECIES";
    mysqlConnection.query(query, (err, rows, fields) => {
        if (!err) {
            res.json({ Status: "ok", rows });
        } else {
            console.log(err);
        }
    });
});

router.post('/registroPets', (req, res) => {
    const insertReg = 0;
    const { nombre, USUARIOS_id, especie, sim } = req.body;
    const query = `
        CALL USUARIOS(?,?,?,?,?,?);`;
    mysqlConnection.query(query, [insertReg, insertReg, USUARIOS_id, nombre, especie, sim], (err, rows, fields) => {
        if (!err) {
            res.json({ Status: "ok" });
        } else {
            console.log("Ocirrio un error al intentar registar la mascota ", err);
            res.json({ Status: "FALLO AL INTENTAR ACTUALIZAR LA MASCOTA" });
        }
    });
})