const Post = require('../models/Post');

// Fetch all posts
exports.getPosts = async (req, res) => {
    try {
        const posts = await Post.find().sort({ timestamp: -1 });
        res.json(posts);
    } catch (error) {
        res.status(500).json({ message: "Error fetching posts" });
    }
};

// Create a new post
exports.createPost = async (req, res) => {
    try {
        const { user, profileImage, imageUrl, caption } = req.body;

        const newPost = new Post({
            user,
            profileImage,
            imageUrl,
            caption
        });

        await newPost.save();
        res.status(201).json(newPost);
    } catch (error) {
        res.status(500).json({ message: "Error creating post" });
    }
};
