require('dotenv').config();
const express = require('express');
const app = express ();
const PORT = 8000;
const mysql = require('mysql2/promise');

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

// root handler and message to show on localhost
app.get('/', (req, res) => {
    res.send('Welcome to the Classroom Pets API!'); 
});

// // a get request to return all the entries from the classroom_pets table using async await and error handling with a http response
app.get('/Classroom_pets', async (req, res) => {
    try {
    const [results] = await pool.query('SELECT * FROM Classroom_pets');
    res.json(results);
}
catch (err) {
    console.error('Error retrieving pets data', err);
    res.status(500).json({message: 'Error retrieving data'});
}})



// example of a post request using req,res
app.post('/Classroom_pets', async (req, res) => {
    const {pet_id, childs_name, pet_type, pet_name, pet_age} = req.body;

    if (typeof pet_id !== 'number' || !childs_name || !pet_type || !pet_name || typeof pet_age !== 'number') {
        return res.status(400).json({error: 'Invalid data request'});
    }

    const query = 'INSERT INTO Classroom_pets (pet_id, childs_name, pet_type, pet_name, pet_age) VALUES (?, ?, ?, ?, ?)';

    try {
        const [results] = await pool.query(query, [pet_id, childs_name, pet_type, pet_name, pet_age]);
        console.log('New pet data:', results);
        res.status(201).json({message: 'New pet added', id:results.insertId});
    } catch (err) {
        console.error('Data insertion failed', err);
        res.status(500).json({error: 'Data insertion failed'});
    }
});


// delete request using async await and try catch
app.delete('/Classroom_pets/:id', async (req, res) => {
    const petId = req.params.id;

    try {
        const [result] = await pool.execute('DELETE FROM Classroom_pets WHERE pet_id = ?', [petId]);
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Pet not found' });
        }

        res.json({ message: 'Pet deleted successfully' });
    } catch (error) {
        console.error('Error deleting pet:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});