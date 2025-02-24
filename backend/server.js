const express = require('express');
const cors = require('cors');
const postRoutes = require('./routes/postRoutes');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use('/api/posts', postRoutes);
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});