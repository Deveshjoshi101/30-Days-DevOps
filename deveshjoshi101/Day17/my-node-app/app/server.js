const express = require('express');
const mongoose = require('mongoose');
const MongoClient = require('mongodb').MongoClient;

const app = express();
const port = 3000;

// MongoDB connection string
const mongoUrl = 'mongodb://mongo:27017';

// Connect to MongoDB using Mongoose
mongoose.connect(`${mongoUrl}/my-database`, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const db = mongoose.connection;
db.on('error', (error) => console.error('Connection error:', error));
db.once('open', () => console.log('Connected to MongoDB'));

// Connect to MongoDB using MongoClient to fetch database information
const client = new MongoClient(mongoUrl, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

client.connect((err) => {
    if (err) {
        console.error('Error connecting to MongoDB:', err);
    } else {
        console.log('Connected to MongoDB with MongoClient');
    }
});

// Define a route to display database information
app.get('/', async (req, res) => {
    try {
        const adminDb = client.db().admin();

        // Fetch list of databases
        const databasesList = await adminDb.listDatabases();

        // Format the response with database names and other properties
        res.send(`
      <h1>Hello, World! This is a simple Node.js app running with MongoDB.</h1>
      <h2>Connected Databases:</h2>
      <ul>
        ${databasesList.databases
                .map(
                    (db) => `<li>
            <strong>Name:</strong> ${db.name} <br />
            <strong>Size on Disk:</strong> ${db.sizeOnDisk} bytes <br />
            <strong>Empty:</strong> ${db.empty}
          </li>`
                )
                .join('')}
      </ul>
    `);
    } catch (error) {
        console.error('Error fetching database information:', error);
        res.status(500).send('Error fetching database information');
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
