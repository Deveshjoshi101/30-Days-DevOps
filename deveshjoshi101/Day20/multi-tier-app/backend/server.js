const { Client } = require('pg');
const express = require('express');
const app = express();
const port = 3000;

// Function to connect to the database
const connectWithRetry = () => {
    const client = new Client({
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
    });

    client.connect()
        .then(() => {
            console.log('Connected to PostgreSQL');

            // Set up a route to fetch all databases
            app.get('/api', async (req, res) => {
                try {
                    const result = await client.query("SELECT datname FROM pg_database WHERE datistemplate = false;");
                    const databases = result.rows.map(row => row.datname);
                    res.json({ message: `Connected to PostgreSQL. Databases: ${databases.join(', ')}` });
                } catch (error) {
                    console.error('Error fetching databases:', error);
                    res.status(500).json({ message: 'Error fetching databases.' });
                }
            });
        })
        .catch(err => {
            console.error('Connection error:', err.message);
            setTimeout(connectWithRetry, 5000);
        });
};

connectWithRetry();

app.get('/', (req, res) => {
    res.send('Hello, World! The backend server is connected to PostgreSQL.');
});

app.listen(port, () => {
    console.log(`Backend server is running on http://localhost:${port}`);
});
