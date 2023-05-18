const { Router } = require("express");
const studentsController = require("../controllers/students");
const overrideMethod = require("../middleware/overrideMethod");

const router = Router();

router.use(overrideMethod);
router.get("/", studentsController.getStudents);
router.get("/search", studentsController.getStudentByEmail);
router.get("/getAddStudentForm", studentsController.getAddStudentForm);
router.post("/createStudent", studentsController.createStudent);
router.get("/:id", studentsController.getStudentById);
router.delete("/:id/delete", studentsController.removeStudentById);

module.exports = router;
