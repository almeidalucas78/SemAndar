// Router: define rotas e encaminha requisições ao controller. Controller: recebe e valida requisições, chama o serviço e retorna a resposta. Serviço: implementa a lógica de negócio.


import express from "express";

import { getAllUsers } from "../controllers/userController.js";

const UserRouter = express.Router();

UserRouter.get("/", getAllUsers);

export default UserRouter;