const express = require('express');
const app = express();
const con = require('./db'); // เชื่อม MySQL
const bcrypt = require('bcrypt');

app.use(express.json());
app.use(express.urlencoded({ extended: true }));



// =================== Login ===================
app.post('/login', async (req, res) => {
  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res.status(400).send("Username and password are required");
    }

    const sql = 'SELECT * FROM user WHERE username = ?';
    con.query(sql, [username], async (err, results) => {
      if (err) return res.status(500).send("Database server error");
      if (results.length !== 1) return res.status(401).send("Wrong username");

      const user = results[0];
      const match = await bcrypt.compare(password, user.password);
      if (!match) return res.status(401).send("Wrong password");

      // ส่ง user_id และ username ให้ Dart
      return res.json({
        success: true,
        message: "Login OK",
        user_id: user.id,
        username: user.username
      });
    });
  } catch (error) {
    console.error("Login error:", error);
    return res.status(500).send("Internal server error");
  }
});

// =================== Expenses ===================

// All expenses for a user
app.get("/expenses", (req, res) => {
  const userId = req.query.user_id;
  const sql = 'SELECT * FROM expense WHERE user_id = ?';
  con.query(sql, [userId], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

// Today's expenses for a user


// Search expense by item keyword


// Add new expense


// Delete expense by id


// =================== Test ===================

app.get('/', (req, res) => res.send('Server is running'));
app.get('/test1', (req, res) => {
  con.query('SELECT * FROM user', (err, results) => {
    if (err) return res.status(500).send("Database error");
    res.json(results);
  });
});

// =================== Start server ===================

const PORT = 3000;
app.listen(PORT, () => {
  console.log('Server is running at ' + PORT);
});
