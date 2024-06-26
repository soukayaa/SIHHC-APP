// utilisateurController.js

const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

 
const getAllUtilisateurs = async (req, res) => {
  try {
    const utilisateurs = await prisma.utilisateur.findMany();
    res.json(utilisateurs);
  } catch (error) {
    res.status(500).json({ error: 'Erreur lors de la récupération des utilisateurs.' });
  }
};

 
const getUtilisateurById = async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const utilisateur = await prisma.utilisateur.findUnique({
      where: { IDutilisateur: id }
    });
    if (!utilisateur) throw new Error('Utilisateur non trouvé.');
    res.json(utilisateur);
  } catch (error) {
    res.status(404).json({ error: error.message });
  }
};

 
const createUtilisateur = async (req, res) => {
  const { Nom, Prenom, Telephone, adresse_email, DateNaissance, Sexe, Adresse, Image, isAdmin, RoleID } = req.body;
  try {
    const nouvelUtilisateur = await prisma.utilisateur.create({
      data: {
        Nom,
        Prenom,
        Telephone,
        adresse_email,
        DateNaissance,
        Sexe,
        Adresse,
        Image,
        isAdmin,
        RoleID
      }
    });
    res.status(201).json(nouvelUtilisateur);
  } catch (error) {
    res.status(400).json({ error: 'Erreur lors de la création de l\'utilisateur.' });
  }
};

 
const updateUtilisateur = async (req, res) => {
  const id = parseInt(req.params.id);
  const { Nom, Prenom, Telephone, adresse_email, DateNaissance, Sexe, Adresse, Image, isAdmin, RoleID } = req.body;
  try {
    const utilisateurModifie = await prisma.utilisateur.update({
      where: { IDutilisateur: id },
      data: {
        Nom,
        Prenom,
        Telephone,
        adresse_email,
        DateNaissance,
        Sexe,
        Adresse,
        Image,
        isAdmin,
        RoleID
      }
    });
    res.json(utilisateurModifie);
  } catch (error) {
    res.status(400).json({ error: 'Erreur lors de la mise à jour de l\'utilisateur.' });
  }
};

// Supprimer un utilisateur
const deleteUtilisateur = async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    await prisma.utilisateur.delete({
      where: { IDutilisateur: id }
    });
    res.json({ message: 'Utilisateur supprimé avec succès.' });
  } catch (error) {
    res.status(400).json({ error: 'Erreur lors de la suppression de l\'utilisateur.' });
  }
};

module.exports = {
  getAllUtilisateurs,
  getUtilisateurById,
  createUtilisateur,
  updateUtilisateur,
  deleteUtilisateur
};
