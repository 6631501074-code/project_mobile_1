const express = require('express');
const app = express();
const con = require('./db'); // เชื่อม MySQL
const bcrypt = require('bcrypt');

app.use(express.json());
app.use(express.urlencoded({ extended: true }));



// =================== Login ===================


// =================== Expenses ===================

// All expenses for a user


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
