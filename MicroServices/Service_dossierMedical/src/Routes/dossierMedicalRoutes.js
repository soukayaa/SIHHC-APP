const express = require('express');
const router = express.Router();
const {
  getAllDossiers,
  getDossierById,
  createDossier,
  updateDossier,
  deleteDossier
} = require('../Controllers/dossierMedicalController');

router.get('/getAllDossiers', getAllDossiers);
router.get('/:id', getDossierById);
router.post('/createDossier', createDossier);
router.put('/:id', updateDossier);
router.delete('/:id', deleteDossier);

module.exports = router;
