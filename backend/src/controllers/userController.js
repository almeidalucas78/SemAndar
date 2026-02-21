//COntroller é responsavel por lidar com as requisições do cliente, ou seja, é onde você vai colocar as rotas da sua aplicação. Ele é responsável por receber as requisições do cliente, chamar o serviço correspondente e retornar a resposta para o cliente. O serviço, por sua vez, é responsável por lidar com a lógica de negócio da aplicação, ou seja, é onde você vai colocar as regras de negócio da sua aplicação.

import { getAllUsersService } from "../services/userService.js";

export const getAllUsers = async (req, res) => {
  try {
    const users = await getAllUsersService();
    res.json(users);
  } catch (error) {
    console.error('Erro ao obter usuários:', error);
    res.status(500).json({ message: 'Erro ao obter usuários' });
  }
}