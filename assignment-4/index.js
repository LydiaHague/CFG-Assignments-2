const express = require('express');
const app = express ();
const PORT = 8000;
const mysql = require('mysql2');

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

// Parse request bodies
app.use(express.json());

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'Foxbox12!',
    database: 'pets'
});


// a get request to return all the entries from the classroom_pets table, including a http response code and error handling
app.get('/Classroom_pets', (req, res) =>{
    pool.query('SELECT * FROM Classroom_pets', (err, results) => {
       if (err) {
          console.error(err);
          return res.status(500).json({error: 'Unable to get information'}); 
       } 
       console.log('Classroom pets', results);
       res.json(results);
    });
});

// example of a post request using req,res
app.post('/Classroom_pets', (req, res) => {
    const {pet_id, childs_name, pet_type, pet_name, pet_age} = req.body;

    if (typeof pet_id !== 'number' || !childs_name || !pet_type || !pet_name || typeof pet_age !== 'number') {
        return res.status(400).json({error: 'Invalid data request'});
    }

    const query = 'INSERT INTO Classroom_pets (pet_id, childs_name, pet_type, pet_name, pet_age) VALUES (?, ?, ?, ?, ?)';
    pool.query(query, [pet_id, childs_name, pet_type, pet_name, pet_age], (err, results) => {
        if (err) {
            console.error('Database insertion failed:', err);
            return res.status(500).json({ error: 'Database insertion failed' });
        }
        console.log('Insertion results:', results);
        res.status(201).json({ message: 'New pet added', id: results.insertId });
    });
});
