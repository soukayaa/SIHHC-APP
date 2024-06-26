// app.js

const express = require('express');
const utilisateurRoutes = require('./Routes/UtilisateurRoutes');
const errorHandler = require('./Middlewares/errorHandler');  
const app = express();


app.use(express.json());

 
app.use('/utilisateurs', utilisateurRoutes);
app.use(errorHandler); 
module.exports = app;
