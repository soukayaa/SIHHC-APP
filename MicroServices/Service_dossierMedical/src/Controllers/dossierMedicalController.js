const prisma = require('../prismaClient');

const getAllDossiers = async (req, res) => {
  try {
    const dossiers = await prisma.dossier_Medical.findMany();
    res.json(dossiers);
  } catch (error) {
    console.error('Erreur lors de la récupération des dossiers médicaux :', error);
    res.status(500).json({ error: 'Erreur lors de la récupération des dossiers médicaux.' });
  }
};

const getDossierById = async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const dossier = await prisma.dossier_Medical.findUnique({
      where: { IDDossierMedical: id }
    });
    if (!dossier) throw new Error(`Dossier médical avec l'ID ${id} non trouvé.`);
    res.json(dossier);
  } catch (error) {
    console.error(`Erreur lors de la récupération du dossier médical avec l'ID ${id} :`, error);
    res.status(404).json({ error: error.message });
  }
};

const createDossier = async (req, res) => {
  const {
    Ordonnances,
    Analyses,
    PathologieID,
    TraitementID,
    VoletSyntheseMedicaleID,
    CorrespondantID,
    FichierImporteID,
    AntecedentsID,
    RapportAnalyseID,
    PersonneEntourageID,
    AllergiesID
  } = req.body;
  try {
    const nouveauDossier = await prisma.dossier_Medical.create({
      data: {
        Ordonnances,
        Analyses,
        PathologieID,
        TraitementID,
        VoletSyntheseMedicaleID,
        CorrespondantID,
        FichierImporteID,
        AntecedentsID,
        RapportAnalyseID,
        PersonneEntourageID,
        AllergiesID
      }
    });
    res.status(201).json(nouveauDossier);
  } catch (error) {
    console.error('Erreur lors de la création du dossier médical :', error);
    res.status(400).json({ error: 'Erreur lors de la création du dossier médical.' });
  }
};

const updateDossier = async (req, res) => {
  const { id } = req.params;
  const {
    Ordonnances,
    Analyses,
    PathologieID,
    TraitementID,
    VoletSyntheseMedicaleID,
    CorrespondantID,
    FichierImporteID,
    AntecedentsID,
    RapportAnalyseID,
    PersonneEntourageID,
    AllergiesID
  } = req.body;

  try {
    const dossierModifie = await prisma.dossier_Medical.update({
      where: { IDDossierMedical: parseInt(id) },
      data: {
        Ordonnances,
        Analyses,
        PathologieID,
        TraitementID,
        VoletSyntheseMedicaleID,
        CorrespondantID,
        FichierImporteID,
        AntecedentsID,
        RapportAnalyseID,
        PersonneEntourageID,
        AllergiesID
      }
    });

    res.json(dossierModifie);
  } catch (error) {
    console.error(`Erreur lors de la mise à jour du dossier médical avec l'ID ${id} :`, error);
    res.status(500).json({ error: 'Erreur interne du serveur' });
  }
};

const deleteDossier = async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    await prisma.dossier_Medical.delete({
      where: { IDDossierMedical: id }
    });
    res.json({ message: 'Dossier médical supprimé avec succès.' });
  } catch (error) {
    console.error(`Erreur lors de la suppression du dossier médical avec l'ID ${id} :`, error);
    res.status(400).json({ error: 'Erreur lors de la suppression du dossier médical.' });
  }
};

module.exports = {
  getAllDossiers,
  getDossierById,
  createDossier,
  updateDossier,
  deleteDossier
};
