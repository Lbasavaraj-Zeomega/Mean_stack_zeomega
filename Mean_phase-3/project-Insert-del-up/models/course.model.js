const mongoose = require('mongoose');

var courseSchema = new mongoose.Schema({
    courseName: {
        type: String,
        
    },
    disc: {
        type: String,
        required: 'This field is required.'
    },
    price: {
        type: String,

    }
});

// Custom validation for email

mongoose.model('course', courseSchema);