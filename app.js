import express from "express";
import { myConexion } from "./db/conexion.js";
import "dotenv/config";

const database = await myConexion();

const appExpress = express();

appExpress.get("/token", (req,res)=>{
    database.query(
        "SELECT * FROM usuario WHERE usuario.usuario = 'usuario1'",
        (err,data)=>{
            res.send({status:200, message: data})
        }
    )
})

const my_server = JSON.parse(process.env.MY_SERVER)
appExpress.listen(my_server, ()=>console.log(`servidor iniciado: http://${my_server.host}:${my_server.port}`))