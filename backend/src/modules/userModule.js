// Módulo: acesso a dados — executa consultas e retorna resultados ao serviço.

import connection from './db/connection.js';

// Função para obter todos os usuários
export const findAllUsers = async () => {
  const [result] = await connection.query('SELECT id, name, email, phone, role, created_at FROM users');
  return result;
};
