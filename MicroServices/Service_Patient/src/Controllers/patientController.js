const prisma = require('../prismaClient');

 
const getAllPatients = async (req, res) => {
    try {
        const patients = await prisma.patient.findMany();
        res.json(patients);
    } catch (error) {
        console.error('Error fetching patients:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
};

 
const getPatientById = async (req, res) => {
    const { id } = req.params;
    try {
        const patient = await prisma.patient.findUnique({ where: { IDPatient: parseInt(id) } });
        if (!patient) {
            return res.status(404).json({ error: 'Patient not found' });
        }
        res.json(patient);
    } catch (error) {
        console.error(`Error fetching patient with ID ${id}:`, error);
        res.status(500).json({ error: 'Internal server error' });
    }
};

 
const createPatient = async (req, res) => {
    const { body } = req;
    try {
        const newPatient = await prisma.patient.create({
            data: {
                numero_securite_sociale: body.numero_securite_sociale,
                Medecin_traitant: body.Medecin_traitant,
                Taille: body.Taille,
                Poids: body.Poids,
                Antecedents_chirurgicaux: body.Antecedents_chirurgicaux,
                medicaments_actuel: body.medicaments_actuel,
                allergies_medicamenteuses: body.allergies_medicamenteuses,
                Traitements_de_longue_duree: body.Traitements_de_longue_duree,
                allergies: body.allergies,
                vaccin_contre_la_grippe: body.vaccin_contre_la_grippe,
                UtilisateurID: body.UtilisateurID
            }
        });
        res.json(newPatient);
    } catch (error) {
        console.error('Error creating patient:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
};


 
const updatePatient = async (req, res) => {
    const { id } = req.params;
    const { body } = req;
    try {
        const updatedPatient = await prisma.patient.update({
            where: { IDPatient: parseInt(id) },
            data: {
                numero_securite_sociale: body.numero_securite_sociale,
                Medecin_traitant: body.Medecin_traitant,
                Taille: body.Taille,
                Poids: body.Poids,
                Antecedents_chirurgicaux: body.Antecedents_chirurgicaux,
                medicaments_actuel: body.medicaments_actuel,
                allergies_medicamenteuses: body.allergies_medicamenteuses,
                Traitements_de_longue_duree: body.Traitements_de_longue_duree,
                allergies: body.allergies,
                vaccin_contre_la_grippe: body.vaccin_contre_la_grippe,
                UtilisateurID: body.UtilisateurID
            }
        });
        res.json(updatedPatient);
    } catch (error) {
        console.error('Error updating patient:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
};


 
const deletePatient = async (req, res) => {
    const { id } = req.params;
    try {
        const deletedPatient = await prisma.patient.delete({ where: { IDPatient: parseInt(id) } });
        res.json(deletedPatient);
    } catch (error) {
        console.error(`Error deleting patient with ID ${id}:`, error);
        res.status(500).json({ error: 'Internal server error' });
    }
};

module.exports = {
    getAllPatients,
    getPatientById,
    createPatient,
    updatePatient,
    deletePatient,
};
