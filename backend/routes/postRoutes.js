const express = require('express');
const { getPosts, createPost } = require('../controllers/postController');

const router = express.Router();

router.get('/', getPosts);  // Fetch all posts
router.post('/', createPost);  // Create a new post

module.exports = router;