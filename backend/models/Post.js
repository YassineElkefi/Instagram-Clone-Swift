const mongoose = require('mongoose');

const PostSchema = new mongoose.Schema({
    user: { type: String, required: true },
    profileImage: { type: String, required: true },
    imageUrl: { type: String, required: true },
    caption: { type: String, required: true },
    likes: { type: Number, default: 0 },
    timestamp: { type: Date, default: Date.now }
});

module.exports = mongoose.model("Post", PostSchema);
