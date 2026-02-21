import connection from "./db/connection.js";

export const findAllProperties = async () => {
  const [result] = await connection.query('SELECT * FROM properties');
  return result;
}