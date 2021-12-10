const express = require("express");

const app = express();

let messageJson = { message: "here we go again" };

app.get("/message", (request, response) => {
  response.send(messageJson);
});

app.listen(3000, () => {
  console.log("listening on port 3000");
});
