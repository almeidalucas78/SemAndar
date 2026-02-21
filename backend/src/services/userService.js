// Serviço: implementa a lógica de negócio — recebe dados do controller e retorna resultados.

import bcrypt from "bcryptjs";
import { findAllUsers } from "../modules/userModule.js";

export const getAllUsersService = async () => {
  const users = await findAllUsers();
  return users;
}