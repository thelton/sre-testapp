require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const locals = require("./middleware/siteTitle");
const studentsRouter = require("./routes/students");

const PORT = 4000;

const app = express();

// allows to use POST and GET json from our endpoints
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "pug");
app.set("views", process.cwd() + "/src/views");

app.use(locals);
app.use("/", studentsRouter);

app.listen(PORT, () =>
  console.log(`✅ server is running on http://localhost:${PORT} 🚀`)
);
