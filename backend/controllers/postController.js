const posts = [
    { id: 1, user: 'user1', title: 'Beautiful Sunset', content: 'This is an amazing sunset photo!', likes: 120 },
    { id: 2, user: 'user2', title: 'Vacation in Bali', content: 'Having a great time in Bali!', likes: 180 },
  ];
  
  exports.getPosts = (req, res) => {
    res.json(posts);
  };
  
  exports.createPost = (req, res) => {
    const newPost = req.body;
    newPost.id = posts.length + 1; // Auto-increment post id
    posts.push(newPost);
    res.json(newPost);
  };
  