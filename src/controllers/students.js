const pool = require("../db");

const getStudents = (req, res) => {
  pool.query("SELECT * FROM students", (error, results) => {
    if (error) throw error;
    res
      .status(200)
      .render("home", { pageTitle: "Home", students: results.rows });
  });
};

const getStudentById = (req, res) => {
  const id = parseInt(req.params.id, 10);
  pool.query("SELECT * FROM students WHERE id = $1", [id], (error, results) => {
    if (error) throw error;
    res.status(200).json(results.rows);
  });
};

const getStudentByEmail = (req, res) => {
  const { email } = req.query;
  pool.query(
    "SELECT * FROM students s WHERE s.email = $1",
    [email],
    (error, results) => {
      const notFound = !results.rows.length;
      if (notFound) {
        return res.status(200).render("search", {
          pageTitle: "Search",
          message: `${email} is not found.`,
        });
      }
      return res
        .status(200)
        .render("search", { pageTitle: "Search", student: results.rows });
    }
  );
};

const getAddStudentForm = (req, res) => {
  res.status(200).render("addStudent", { pageTitle: "Add Student" });
};

const createStudent = (req, res) => {
  const { name, email, age, dob } = req.body;
  pool.query(
    "INSERT INTO students (name, email, age, dob) VALUES ($1, $2, $3, $4)",
    [name, email, age, dob],
    (error, results) => {
      const notFound = !results.rows.length;
      if (notFound)
        res.send("Student does not exist in the database, could not remove.");
      res.status(201).redirect("/");
    }
  );
};

const removeStudentById = (req, res) => {
  const id = parseInt(req.params.id, 10);
  pool.query("DELETE FROM students WHERE id = $1", [id], (error, results) => {
    if (error) throw error;
    res.status(200).redirect("/");
  });
};

module.exports = {
  getStudents,
  getStudentById,
  getStudentByEmail,
  createStudent,
  getAddStudentForm,
  removeStudentById,
};
