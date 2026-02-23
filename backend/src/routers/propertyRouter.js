import express from "express"; //express é responsavel por criar o servidor e definir as rotas da aplicação.
import { getAllProperties } from "../controllers/propertyController.js"; //importa a função getAllProperties do controller.

const PropertyRouter = express.Router(); //cria uma instância do router do express.

PropertyRouter.get("/ ", getAllProperties); //define a rota GET / para chamar a função getAllProperties do controller.

export default PropertyRouter; 