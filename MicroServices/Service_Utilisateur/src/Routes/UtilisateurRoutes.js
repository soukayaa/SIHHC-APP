 

const express = require('express');
const router = express.Router();
const{
    getAllUtilisateurs,
    getUtilisateurById,
    createUtilisateur,
    updateUtilisateur,
    deleteUtilisateur,
} = require('../Controllers/utilisateurController')


 
router.get('/getAllUtilisateurs', getAllUtilisateurs);

 
router.get('/:id', getUtilisateurById);
 
router.post('/createUtilisateur',createUtilisateur);

 
router.put('/:id', updateUtilisateur);

 
router.delete('/:id',deleteUtilisateur);

module.exports = router;
