// wait-for-it.js
const net = require('net');

const host = process.argv[2].split(':')[0];
const port = parseInt(process.argv[2].split(':')[1], 10);

const retryInterval = 5000;

function checkConnection() {
    const socket = new net.Socket();

    socket.setTimeout(3000);
    socket.on('connect', () => {
        console.log('Database is ready, starting the application...');
        process.exit(0);
    });

    socket.on('error', () => {
        console.log(`Database not ready, retrying in ${retryInterval / 1000} seconds...`);
        setTimeout(checkConnection, retryInterval);
    });

    socket.on('timeout', () => {
        console.log(`Timeout - database not ready, retrying in ${retryInterval / 1000} seconds...`);
        setTimeout(checkConnection, retryInterval);
    });

    socket.connect(port, host);
}

checkConnection();
