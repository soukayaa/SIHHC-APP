const express = require('express');
const app = require('./app');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const PORT = process.env.PORT || 3000; 

app.listen(PORT, () => {
  console.log(`Patient service listening on port ${PORT}`);
});
