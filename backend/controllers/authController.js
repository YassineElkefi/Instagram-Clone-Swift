const User = require("../models/User");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { validationResult } = require("express-validator");

exports.registerUser = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { username, email, password, profileImage } = req.body;

  try {
    let user = await User.findOne({ email });
    if (user) {
      return res.status(400).json({ message: "User already exists" });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    user = new User({
      username,
      email,
      password: hashedPassword,
      profileImage
    });

    await user.save();
    
    // Check if JWT_SECRET exists
    if (!process.env.JWT_SECRET) {
      console.error("JWT_SECRET is not defined in environment variables");
      return res.status(500).json({ message: "Server configuration error" });
    }

    const payload = { userId: user.id };
    
    try {
      const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: "7d" });
      res.status(201).json({ 
        token, 
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          profileImage: user.profileImage
        }
      });
    } catch (jwtError) {
      console.error("JWT signing error:", jwtError);
      return res.status(500).json({ message: "Error generating authentication token" });
    }

  } catch (error) {
    console.error("Registration error:", error);
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    // Validate input
    if (!email || !password) {
      return res.status(400).json({ message: "Please provide both email and password" });
    }

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "Invalid credentials" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ message: "Invalid credentials" });
    }

    // Check if JWT_SECRET exists
    if (!process.env.JWT_SECRET) {
      console.error("JWT_SECRET is not defined in environment variables");
      return res.status(500).json({ message: "Server configuration error" });
    }

    const payload = { userId: user.id };
    
    try {
      const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: "7d" });
      res.json({ 
        token, 
        user: {
          id: user.id,
          username: user.username,
          email: user.email,
          profileImage: user.profileImage
        }
      });
    } catch (jwtError) {
      console.error("JWT signing error:", jwtError);
      return res.status(500).json({ message: "Error generating authentication token" });
    }

  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

exports.getUserProfile = async (req, res) => {
    try {
      console.log("User ID from token:", req.user.userId);
      
      const user = await User.findById(req.user.userId)
        .select("-password")
        .lean();
      
      if (!user) {
        return res.status(404).json({ message: "User not found" });
      }
  
      res.json(user);
    } catch (error) {
      console.error("Get user profile error:", error);
      res.status(500).json({ 
        message: "Server error", 
        error: error.message 
      });
    }
  };