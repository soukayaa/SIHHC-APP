const express = require('express');
const patientRoutes = require('./Routes/patientRoutes');  
const errorHandler = require('./Middlewares/errorHandler');  

const app = express();  

app.use(express.json()); 

app.use('/patients', patientRoutes);  

app.use(errorHandler); 
module.exports = app; 