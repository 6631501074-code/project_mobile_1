// db.js
const mysql = require('mysql2');

const con = mysql.createConnection({
  host: "localhost",
  user: "root",       // ใส่ user ของ MySQL
  password: "",       // ใส่รหัสผ่านของ MySQL
  database: "expenses" // ใส่ชื่อฐานข้อมูล
});

con.connect((err) => {
  if (err) {
    console.error("❌ Database connection failed:", err.message);
    process.exit(1);
  }
  console.log("✅ Connected to MySQL");
});

module.exports = con;
