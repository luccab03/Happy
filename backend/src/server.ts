// GET - POST - PUT - DELETE

// Get = Buscar info
// Post = Criando uma info

// Put = Editar uma info
// Delete = Deletar uma info

// Query parms: http://localhost:3333/users?search=lucca&page=2
// Route parms: http://localhost:3333/users/1 (Identificar um recurso)
// Body: http://localhost:3333/users (Identificar um recurso)

import express from "express";
import "express-async-errors";
import errorHandler from "./errors/Handler";

import routes from "./routes";
import path from "path";
import cors from "cors";

import "./database/connection.ts";

const app = express();

app.use(cors());

app.use(express.json());

app.use(routes);

app.use("/uploads", express.static(path.join(__dirname, "..", "uploads")));

app.use(errorHandler);

app.listen(3333);
