import mysql from "mysql2/promise";

async function connectToDatabase() {
  const connection = await mysql.createConnection({
    host: Bun.env.DB_HOST,
    port: Number(Bun.env.DB_PORT),
    user: Bun.env.DB_USER,
    password: Bun.env.DB_PASSWORD,
    database: Bun.env.DB_NAME
  });

  console.log("Veritabanına başarıyla bağlandı!");
  return connection;
}

const db = await connectToDatabase();
export default db

