import mysql from 'mysql2/promise';
import 'dotenv/config';

// Criamos um pool de conexões (igual ao seu projeto de referência)
const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'semandar_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Teste rápido para saber se conectou
pool.getConnection()
  .then(conn => {
    console.log('✅ MySQL conectado com sucesso!');
    conn.release();
  })
  .catch(err => {
    console.error('❌ Erro ao conectar no MySQL:', err.message);
  });

export default pool;