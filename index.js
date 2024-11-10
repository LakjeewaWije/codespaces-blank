const { createServer } = require('http');

const hostname = '0.0.0.0'; // Listen on all available interfaces
const port = 3000;

const server = createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin'); // Set Referrer-Policy header
  res.end('Hi this a sample node application to demonstrate the network CA One!');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});