import connection from "./db/connection.js";

export const getDistinctCities = async (searchTerm) => {
  try {
    // Query para buscar cidades distintas que começam com o searchTerm
    // Usamos LIKE para busca parcial e DISTINCT para evitar duplicatas
    const [rows] = await connection.query(
      `SELECT DISTINCT city FROM properties WHERE city LIKE ? ORDER BY city ASC`,
      [`${searchTerm}%`]
    );
    return rows.map(row => row.city);
  } catch (error) {
    console.error('Erro ao buscar cidades no banco de dados:', error);
    throw new Error('Erro ao buscar cidades');
  } 
};
