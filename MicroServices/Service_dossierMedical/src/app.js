const express = require('express');
const app = express();
const dossierMedicalRoutes = require('./Routes/dossierMedicalRoutes');
const errorHandler = require('./middlewares/errorHandler'); 

// Middleware pour parser le JSON
app.use(express.json());

// Routes
app.use('/dossiers', dossierMedicalRoutes);

// Middleware de gestion des erreurs
app.use(errorHandler);

module.exports = app;
