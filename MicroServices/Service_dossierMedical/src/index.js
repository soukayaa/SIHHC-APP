const express = require('express');
const { PrismaClient } = require('@prisma/client');
 
require('dotenv').config();
const app = require('./app');
const PORT = process.env.PORT || 3000;
const prisma = new PrismaClient();
app.listen(PORT, () => {
  console.log(`Serveur démarré sur le port ${PORT}`);
});