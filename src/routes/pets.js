const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');
module.exports = router;


router.get('/listadoMascotas', (req, res) => {
    const { id } = req.body;
    const query = "SELECT M.id, M.nombre, E.especie FROM USUARIOS_MASCOTAS  UM JOIN MASCOTAS M on UM.MASCOTAS_id = M.id JOIN ESPECIES E on M.ESPECIES_id = E.id WHERE UM.USUARIOS_id = ?;";
    mysqlConnection.query(query, [id], (err, rows, fields) => {
        if (!err) {
            !(rows.length === 0) ? res.json(rows) : res.json({ Status: "No hay ninguna mascota registrada" });
        } else {
            console.log(err);
        }
    });
});