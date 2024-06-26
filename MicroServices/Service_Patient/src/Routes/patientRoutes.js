const express = require('express');
const router = express.Router();
const {
    getAllPatients,
    getPatientById,
    createPatient,
    updatePatient,
    deletePatient,
} = require('../Controllers/patientController');

// Routes
router.get('/getAllPatients', getAllPatients);
router.get('/:id', getPatientById);
router.post('/createPatient', createPatient);
router.put('/:id', updatePatient);
router.delete('/:id', deletePatient);

module.exports = router;
