import express from 'express'; //usado para criar o servidor e lidar com as rotas

import cors from 'cors'; //usado para permitir que o frontend acesse o backend
import userRouter from './src/routers/userRouter.js';
import propertyRouter from './src/routers/propertyRouter.js';
import CityRouter from './src/routers/cityRouter.js';

const app = express(); //cria uma instância do express que é o nosso servidor

app.use(cors()); //habilita o CORS para permitir que o frontend acesse o backend
app.use(express.json()); // permite interpretar JSON no corpo das requisições

app.use("/users", userRouter);     
app.use("/properties", propertyRouter); 
app.use("/cities", CityRouter);

export default app; 