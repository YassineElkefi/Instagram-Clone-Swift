const express = require("express");
const { check } = require("express-validator");
const { registerUser, loginUser, getUserProfile } = require("../controllers/authController");
const authMiddleware = require("../middleware/authMiddleware");

const router = express.Router();

router.post(
    "/register",
    [
        check("username", "Username is required").not().isEmpty(),
        check("email", "Please include a valid email").isEmail(),
        check("password", "Password must be at least 6 characters").isLength({ min: 6 })
    ],
    registerUser
);

router.post("/login", loginUser);
router.get("/me", authMiddleware, getUserProfile);

module.exports = router;
