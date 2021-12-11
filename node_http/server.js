// const express = require("express");

// const app = express();

// let messageJson = { message: "here we go again" };

// app.get("/message", (request, response) => {
//   response.send(messageJson);
// });

// app.listen(3000, () => {
//   console.log("listening on port 3000");
// });

//update the node js  code to this

const http = require("http");
const hostname = "127.0.0.1";
const port = 3000;
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
  res.end("Hello World\n");
});
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
