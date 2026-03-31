import connection from "./db/connection.js";

export const findAllProperties = async () => {
  const [result] = await connection.query('SELECT * FROM properties');
  return result;
}

export const findPropertiesByFilters = async (filters) => {
  const { city, type, maxPrice } = filters;
  let sql = "SELECT * FROM properties WHERE 1=1";
  const params = [];

  if (city) {
    sql += " AND city LIKE ?";
    params.push(`%${city}%`);
  }
  if (type) {
    sql += " AND type = ?";
    params.push(type);
  }
  if (maxPrice) {
    sql += " AND price <= ?";
    params.push(maxPrice);
  }

  const [result] = await connection.query(sql, params);
  return result;
};