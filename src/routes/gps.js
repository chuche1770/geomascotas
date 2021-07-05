const express = require('express');
const router = express.Router();
const mysqlConnection = require('../database');
module.exports = router;


router.post('/gps', (req, res) => {
    const separador = "/";
    const { informacion } = req.body;
    arryInfo = dividirCadena(informacion, separador);
    arryInfo[2] = arryInfo[2].slice(0, arryInfo[2].length - 4)
    // console.log(arryInfo[0]);
    // console.log(arryInfo[1]);
    // console.log(arryInfo[2]);
    const sql = "UPDATE LOCALIZADORES SET latitud = ?, longitud  = ? WHERE sim = ?";
    mysqlConnection.query(sql, [arryInfo[1], arryInfo[2], arryInfo[0]], (err, rows, fields) => {
        if (!err) {
            res.json({ Status: "ok" });
        } else {
            console.log(err);
        }
    });
});

function dividirCadena(cadenaADividir, separador) {
    var arrayDeCadenas = cadenaADividir.split(separador, 3);
    return arrayDeCadenas;

}