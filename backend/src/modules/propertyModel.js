import connection from "./db/connection.js";

export const findAllProperties = async () => {
  const [result] = await connection.query('SELECT id, title, type, price, city, transaction_type FROM properties');
  return result;
}

export const findPropertiesByFilters = async (filters) => {
  const { city, type, maxPrice, transactionType } = filters;
  let sql = "SELECT id, title, description, type, status, transaction_type, price, bedrooms, bathrooms, area_m2, city FROM properties WHERE 1=1";
  const params = [];

  if (transactionType) {
    sql += " AND transaction_type = ?";
    params.push(transactionType);
  }
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

export const findCitySuggestions = async (name) =>{
  const sql = "SELECT DISTINCT city FROM properties WHERE city LIKE ? LIMIT 10";
  const [result] = await connection.query(sql, [`%${name}%`]);
  return result;
}