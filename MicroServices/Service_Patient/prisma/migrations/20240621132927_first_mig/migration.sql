/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Patient" (
    "IDPatient" SERIAL NOT NULL,
    "numero_securite_sociale" TEXT NOT NULL,
    "Medecin_traitant" TEXT NOT NULL,
    "Taille" DOUBLE PRECISION NOT NULL,
    "Poids" DOUBLE PRECISION NOT NULL,
    "Antecedents_chirurgicaux" TEXT NOT NULL,
    "medicaments_actuel" TEXT NOT NULL,
    "allergies_medicamenteuses" TEXT NOT NULL,
    "Traitements_de_longue_duree" TEXT NOT NULL,
    "allergies" BOOLEAN NOT NULL,
    "vaccin_contre_la_grippe" BOOLEAN NOT NULL,
    "UtilisateurID" INTEGER NOT NULL,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("IDPatient")
);

-- CreateTable
CREATE TABLE "Medecin" (
    "IDMedecin" SERIAL NOT NULL,
    "ServiceID" INTEGER NOT NULL,
    "ProSanteID" INTEGER NOT NULL,

    CONSTRAINT "Medecin_pkey" PRIMARY KEY ("IDMedecin")
);

-- CreateTable
CREATE TABLE "Dossier_Medical" (
    "IDDossierMedical" SERIAL NOT NULL,
    "PatientID" INTEGER NOT NULL,
    "Ordonnances" TEXT NOT NULL,
    "Analyses" TEXT NOT NULL,
    "PathologieID" INTEGER NOT NULL,
    "TraitementID" INTEGER NOT NULL,
    "VoletSyntheseMedicaleID" INTEGER NOT NULL,
    "CorrespondantID" INTEGER NOT NULL,
    "FichierImporteID" INTEGER NOT NULL,
    "AntecedentsID" INTEGER NOT NULL,
    "RapportAnalyseID" INTEGER NOT NULL,
    "PersonneEntourageID" INTEGER NOT NULL,
    "AllergiesID" INTEGER NOT NULL,

    CONSTRAINT "Dossier_Medical_pkey" PRIMARY KEY ("IDDossierMedical")
);

-- CreateTable
CREATE TABLE "Consultation" (
    "ID" SERIAL NOT NULL,
    "Date" TEXT NOT NULL,
    "PraticienID" INTEGER NOT NULL,
    "Motif" TEXT NOT NULL,
    "Informations" TEXT NOT NULL,
    "OrdonnanceID" INTEGER NOT NULL,
    "Type" TEXT NOT NULL,
    "DossierMedicalID" INTEGER NOT NULL,
    "MedecinID" INTEGER NOT NULL,

    CONSTRAINT "Consultation_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Analyses" (
    "ID_Analyses" SERIAL NOT NULL,
    "Type_analyse" TEXT NOT NULL,
    "Date_prescription" TIMESTAMP(3) NOT NULL,
    "Statut" TEXT NOT NULL,
    "ConsultationID" INTEGER NOT NULL,
    "LaboratoireID" INTEGER NOT NULL,

    CONSTRAINT "Analyses_pkey" PRIMARY KEY ("ID_Analyses")
);

-- CreateTable
CREATE TABLE "Ordonnance" (
    "IDOrdonnance" SERIAL NOT NULL,
    "ConsultationID" INTEGER NOT NULL,
    "MedecinPrescripteurID" INTEGER NOT NULL,
    "ListeMedicaments" TEXT NOT NULL,
    "Posologie" TEXT NOT NULL,
    "RapportAnalyseID" INTEGER NOT NULL,

    CONSTRAINT "Ordonnance_pkey" PRIMARY KEY ("IDOrdonnance")
);

-- CreateTable
CREATE TABLE "RapportAnalyse" (
    "ID_rapportAnalyse" SERIAL NOT NULL,
    "parametre_analyse" TEXT NOT NULL,
    "Valeur_mesuree" TEXT NOT NULL,
    "unite_de_mesure" TEXT NOT NULL,
    "intervalle_reference" TEXT NOT NULL,
    "Interpretation" TEXT NOT NULL,
    "LaboratoireID" INTEGER NOT NULL,

    CONSTRAINT "RapportAnalyse_pkey" PRIMARY KEY ("ID_rapportAnalyse")
);

-- CreateTable
CREATE TABLE "Laboratoire" (
    "IDLaboratoire" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Adresse" TEXT NOT NULL,
    "ProSanteID" INTEGER NOT NULL,

    CONSTRAINT "Laboratoire_pkey" PRIMARY KEY ("IDLaboratoire")
);

-- CreateTable
CREATE TABLE "Document" (
    "ID_Document" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,
    "Document" TEXT NOT NULL,
    "ProID" INTEGER NOT NULL,

    CONSTRAINT "Document_pkey" PRIMARY KEY ("ID_Document")
);

-- CreateTable
CREATE TABLE "Pro_Sante" (
    "ID_pro" SERIAL NOT NULL,
    "Certificat" BYTEA NOT NULL,
    "Specialite" TEXT NOT NULL,
    "UtilisateurID" INTEGER NOT NULL,

    CONSTRAINT "Pro_Sante_pkey" PRIMARY KEY ("ID_pro")
);

-- CreateTable
CREATE TABLE "Teleconsultation" (
    "IDTeleconsultation" SERIAL NOT NULL,
    "MedecinID" INTEGER NOT NULL,
    "Creneau" TEXT NOT NULL,
    "Statut" TEXT NOT NULL,
    "CreneauHoraireID" INTEGER NOT NULL,

    CONSTRAINT "Teleconsultation_pkey" PRIMARY KEY ("IDTeleconsultation")
);

-- CreateTable
CREATE TABLE "Utilisateur" (
    "IDutilisateur" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Telephone" TEXT NOT NULL,
    "adresse_email" TEXT NOT NULL,
    "DateNaissance" TIMESTAMP(3) NOT NULL,
    "Sexe" TEXT NOT NULL,
    "Adresse" TEXT NOT NULL,
    "Image" BYTEA NOT NULL,
    "isAdmin" BOOLEAN NOT NULL,
    "RoleID" INTEGER NOT NULL,

    CONSTRAINT "Utilisateur_pkey" PRIMARY KEY ("IDutilisateur")
);

-- CreateTable
CREATE TABLE "Compte_utilisateur" (
    "IDCompte" SERIAL NOT NULL,
    "Pseudo" TEXT NOT NULL,
    "MotDePasse" TEXT NOT NULL,
    "UtilisateurID" INTEGER NOT NULL,

    CONSTRAINT "Compte_utilisateur_pkey" PRIMARY KEY ("IDCompte")
);

-- CreateTable
CREATE TABLE "Message" (
    "IDMessage" SERIAL NOT NULL,
    "Contenu" TEXT NOT NULL,
    "Date_envoi" TEXT NOT NULL,
    "emetteurID" INTEGER NOT NULL,
    "recepteurID" INTEGER NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("IDMessage")
);

-- CreateTable
CREATE TABLE "Role" (
    "IDRole" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("IDRole")
);

-- CreateTable
CREATE TABLE "Disponibilite" (
    "IDDisponibilite" SERIAL NOT NULL,
    "Etat" TEXT NOT NULL,
    "Date" TIMESTAMP(3) NOT NULL,
    "Jour" TEXT NOT NULL,
    "creneau_horaireID" INTEGER NOT NULL,
    "utilisateurID" INTEGER NOT NULL,

    CONSTRAINT "Disponibilite_pkey" PRIMARY KEY ("IDDisponibilite")
);

-- CreateTable
CREATE TABLE "Planning" (
    "IDPlanning" SERIAL NOT NULL,
    "Pro_santeID" INTEGER NOT NULL,
    "CreneauDisponibleID" INTEGER NOT NULL,

    CONSTRAINT "Planning_pkey" PRIMARY KEY ("IDPlanning")
);

-- CreateTable
CREATE TABLE "Service" (
    "IDService" SERIAL NOT NULL,
    "Type" TEXT NOT NULL,
    "Prix" DOUBLE PRECISION NOT NULL,
    "Duree" TEXT NOT NULL,
    "Lieu" TEXT NOT NULL,
    "DisponibiliteID" INTEGER NOT NULL,

    CONSTRAINT "Service_pkey" PRIMARY KEY ("IDService")
);

-- CreateTable
CREATE TABLE "Panier_demande" (
    "ID_panier" SERIAL NOT NULL,
    "ServiceID" INTEGER NOT NULL,
    "FactureID" INTEGER NOT NULL,

    CONSTRAINT "Panier_demande_pkey" PRIMARY KEY ("ID_panier")
);

-- CreateTable
CREATE TABLE "Facture" (
    "IDFacture" SERIAL NOT NULL,
    "Montant" DOUBLE PRECISION NOT NULL,
    "Date_facturation" TIMESTAMP(3) NOT NULL,
    "Date_paiement" TIMESTAMP(3) NOT NULL,
    "PaiementID" INTEGER NOT NULL,

    CONSTRAINT "Facture_pkey" PRIMARY KEY ("IDFacture")
);

-- CreateTable
CREATE TABLE "Paiement" (
    "IDPaiement" SERIAL NOT NULL,
    "Mode_paiement" TEXT NOT NULL,
    "Montant" DOUBLE PRECISION NOT NULL,
    "Date_paiement" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Paiement_pkey" PRIMARY KEY ("IDPaiement")
);

-- CreateTable
CREATE TABLE "Demande_RendezVous" (
    "IDDemandeRDV" SERIAL NOT NULL,
    "PatientID" INTEGER NOT NULL,
    "ServiceID" INTEGER NOT NULL,
    "Creanaux" INTEGER NOT NULL,
    "Statut" TEXT NOT NULL,

    CONSTRAINT "Demande_RendezVous_pkey" PRIMARY KEY ("IDDemandeRDV")
);

-- CreateTable
CREATE TABLE "Documents_Patient" (
    "ID_Document" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Document" TEXT NOT NULL,
    "PatientID" INTEGER NOT NULL,

    CONSTRAINT "Documents_Patient_pkey" PRIMARY KEY ("ID_Document")
);

-- CreateTable
CREATE TABLE "Pathologie" (
    "ID" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Pathologie_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Traitement" (
    "Identifiant" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,
    "Date_debut" TIMESTAMP(3) NOT NULL,
    "Date_fin" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Traitement_pkey" PRIMARY KEY ("Identifiant")
);

-- CreateTable
CREATE TABLE "VoletSyntheseMedicale" (
    "ID" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,
    "Date" TEXT NOT NULL,
    "Contenu" TEXT NOT NULL,

    CONSTRAINT "VoletSyntheseMedicale_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Correspondant" (
    "ID" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Specialite" TEXT NOT NULL,
    "Contact" TEXT NOT NULL,

    CONSTRAINT "Correspondant_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "PersonneEntourage" (
    "ID_PersonneEntourage" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Lien_parente" TEXT NOT NULL,
    "Contact" TEXT NOT NULL,
    "PatientID" INTEGER NOT NULL,

    CONSTRAINT "PersonneEntourage_pkey" PRIMARY KEY ("ID_PersonneEntourage")
);

-- CreateTable
CREATE TABLE "FichierImporte" (
    "ID" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "Date_importation" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FichierImporte_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Antecedents" (
    "ID" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Antecedents_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Allergies" (
    "ID_Allergies" SERIAL NOT NULL,
    "Type" TEXT NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Allergies_pkey" PRIMARY KEY ("ID_Allergies")
);

-- CreateTable
CREATE TABLE "Suivi_Patient" (
    "IDSuiviPatient" SERIAL NOT NULL,
    "PatientID" INTEGER NOT NULL,

    CONSTRAINT "Suivi_Patient_pkey" PRIMARY KEY ("IDSuiviPatient")
);

-- CreateTable
CREATE TABLE "DemandeUrgence" (
    "IDDemandeUrgence" SERIAL NOT NULL,
    "PatientID" INTEGER NOT NULL,
    "Equipe_urgenceID" INTEGER NOT NULL,
    "VehiculeID" INTEGER NOT NULL,
    "Statut" TEXT NOT NULL,
    "DateCreation" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DemandeUrgence_pkey" PRIMARY KEY ("IDDemandeUrgence")
);

-- CreateTable
CREATE TABLE "CommandeMedicaments" (
    "IDCommandeMedicaments" SERIAL NOT NULL,
    "OrdonnanceID" INTEGER NOT NULL,
    "PharmacieID" INTEGER NOT NULL,
    "Statut" TEXT NOT NULL,
    "DateCommande" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CommandeMedicaments_pkey" PRIMARY KEY ("IDCommandeMedicaments")
);

-- CreateTable
CREATE TABLE "Pharmacie" (
    "ID_Pharmacie" SERIAL NOT NULL,

    CONSTRAINT "Pharmacie_pkey" PRIMARY KEY ("ID_Pharmacie")
);

-- CreateTable
CREATE TABLE "Equipe_Urgence" (
    "IDEquipe" SERIAL NOT NULL,

    CONSTRAINT "Equipe_Urgence_pkey" PRIMARY KEY ("IDEquipe")
);

-- CreateTable
CREATE TABLE "Pro_Equipe" (
    "ID_pro" INTEGER NOT NULL,
    "IDEquipe" INTEGER NOT NULL,

    CONSTRAINT "Pro_Equipe_pkey" PRIMARY KEY ("ID_pro","IDEquipe")
);

-- CreateTable
CREATE TABLE "Pro_Centre" (
    "ID_pro" INTEGER NOT NULL,
    "ID_Centre" INTEGER NOT NULL,

    CONSTRAINT "Pro_Centre_pkey" PRIMARY KEY ("ID_pro","ID_Centre")
);

-- CreateTable
CREATE TABLE "Centre" (
    "IDCentre" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Adresse" TEXT NOT NULL,
    "Type" TEXT NOT NULL,

    CONSTRAINT "Centre_pkey" PRIMARY KEY ("IDCentre")
);

-- CreateTable
CREATE TABLE "Vehicule" (
    "IDVehicule" SERIAL NOT NULL,
    "Type" TEXT NOT NULL,
    "Immatriculation" TEXT NOT NULL,
    "Etat" TEXT NOT NULL,
    "Statut" TEXT NOT NULL,
    "DateMajEtat" TIMESTAMP(3) NOT NULL,
    "CentreID" INTEGER NOT NULL,

    CONSTRAINT "Vehicule_pkey" PRIMARY KEY ("IDVehicule")
);

-- CreateTable
CREATE TABLE "Disponibilite_Vehicule" (
    "IDDisponibiliteVehicule" SERIAL NOT NULL,
    "DateDebut" TIMESTAMP(3) NOT NULL,
    "DateFin" TIMESTAMP(3) NOT NULL,
    "VehiculeID" INTEGER NOT NULL,
    "Creneau_horaireID" INTEGER NOT NULL,

    CONSTRAINT "Disponibilite_Vehicule_pkey" PRIMARY KEY ("IDDisponibiliteVehicule")
);

-- CreateTable
CREATE TABLE "Creneau_horaire" (
    "ID_Creneau" SERIAL NOT NULL,
    "heure_debut" TIMESTAMP(3) NOT NULL,
    "heure_fin" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Creneau_horaire_pkey" PRIMARY KEY ("ID_Creneau")
);

-- CreateTable
CREATE TABLE "Ligne_Commande" (
    "ID_Ordonnance" INTEGER NOT NULL,
    "ID_Medicaments" INTEGER NOT NULL,
    "Qte" DOUBLE PRECISION NOT NULL,
    "Prix" DOUBLE PRECISION NOT NULL,
    "Statut" INTEGER NOT NULL,
    "FactureID" INTEGER NOT NULL,
    "LivraisonID" INTEGER NOT NULL,
    "CommandeID" INTEGER NOT NULL,

    CONSTRAINT "Ligne_Commande_pkey" PRIMARY KEY ("ID_Ordonnance","ID_Medicaments")
);

-- CreateTable
CREATE TABLE "Livraison" (
    "ID_Livraison" SERIAL NOT NULL,
    "Date_Livraison" TIMESTAMP(3) NOT NULL,
    "LigneCommandeID" INTEGER NOT NULL,

    CONSTRAINT "Livraison_pkey" PRIMARY KEY ("ID_Livraison")
);

-- CreateTable
CREATE TABLE "Facture_Commande" (
    "IDFacture" SERIAL NOT NULL,
    "Montant" DOUBLE PRECISION NOT NULL,
    "Date_Facturation" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Facture_Commande_pkey" PRIMARY KEY ("IDFacture")
);

-- CreateTable
CREATE TABLE "Paiement_Commande" (
    "ID_Paiement" SERIAL NOT NULL,
    "Mode_paiement" TEXT NOT NULL,
    "Montant" DOUBLE PRECISION NOT NULL,
    "Date_paiement" TIMESTAMP(3) NOT NULL,
    "Facture_Commande_ID" INTEGER,

    CONSTRAINT "Paiement_Commande_pkey" PRIMARY KEY ("ID_Paiement")
);

-- CreateTable
CREATE TABLE "Alerte" (
    "IDAlerte" SERIAL NOT NULL,
    "Message" TEXT NOT NULL,
    "Niveau" TEXT NOT NULL,
    "Date" TIMESTAMP(3) NOT NULL,
    "Suivi_PatientID" INTEGER NOT NULL,

    CONSTRAINT "Alerte_pkey" PRIMARY KEY ("IDAlerte")
);

-- CreateTable
CREATE TABLE "_Equipe_UrgenceToPro_Sante" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Dossier_Medical_PatientID_key" ON "Dossier_Medical"("PatientID");

-- CreateIndex
CREATE UNIQUE INDEX "Consultation_OrdonnanceID_key" ON "Consultation"("OrdonnanceID");

-- CreateIndex
CREATE UNIQUE INDEX "Analyses_ConsultationID_key" ON "Analyses"("ConsultationID");

-- CreateIndex
CREATE UNIQUE INDEX "Laboratoire_ProSanteID_key" ON "Laboratoire"("ProSanteID");

-- CreateIndex
CREATE UNIQUE INDEX "Document_ProID_key" ON "Document"("ProID");

-- CreateIndex
CREATE UNIQUE INDEX "Pro_Sante_UtilisateurID_key" ON "Pro_Sante"("UtilisateurID");

-- CreateIndex
CREATE UNIQUE INDEX "Compte_utilisateur_UtilisateurID_key" ON "Compte_utilisateur"("UtilisateurID");

-- CreateIndex
CREATE UNIQUE INDEX "Message_emetteurID_key" ON "Message"("emetteurID");

-- CreateIndex
CREATE UNIQUE INDEX "Message_recepteurID_key" ON "Message"("recepteurID");

-- CreateIndex
CREATE UNIQUE INDEX "Demande_RendezVous_PatientID_key" ON "Demande_RendezVous"("PatientID");

-- CreateIndex
CREATE UNIQUE INDEX "Suivi_Patient_PatientID_key" ON "Suivi_Patient"("PatientID");

-- CreateIndex
CREATE UNIQUE INDEX "_Equipe_UrgenceToPro_Sante_AB_unique" ON "_Equipe_UrgenceToPro_Sante"("A", "B");

-- CreateIndex
CREATE INDEX "_Equipe_UrgenceToPro_Sante_B_index" ON "_Equipe_UrgenceToPro_Sante"("B");

-- AddForeignKey
ALTER TABLE "Patient" ADD CONSTRAINT "Patient_UtilisateurID_fkey" FOREIGN KEY ("UtilisateurID") REFERENCES "Utilisateur"("IDutilisateur") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Medecin" ADD CONSTRAINT "Medecin_ServiceID_fkey" FOREIGN KEY ("ServiceID") REFERENCES "Service"("IDService") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Medecin" ADD CONSTRAINT "Medecin_ProSanteID_fkey" FOREIGN KEY ("ProSanteID") REFERENCES "Pro_Sante"("ID_pro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_PersonneEntourageID_fkey" FOREIGN KEY ("PersonneEntourageID") REFERENCES "PersonneEntourage"("ID_PersonneEntourage") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES "Patient"("IDPatient") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_PathologieID_fkey" FOREIGN KEY ("PathologieID") REFERENCES "Pathologie"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_TraitementID_fkey" FOREIGN KEY ("TraitementID") REFERENCES "Traitement"("Identifiant") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_VoletSyntheseMedicaleID_fkey" FOREIGN KEY ("VoletSyntheseMedicaleID") REFERENCES "VoletSyntheseMedicale"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_CorrespondantID_fkey" FOREIGN KEY ("CorrespondantID") REFERENCES "Correspondant"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_FichierImporteID_fkey" FOREIGN KEY ("FichierImporteID") REFERENCES "FichierImporte"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_AntecedentsID_fkey" FOREIGN KEY ("AntecedentsID") REFERENCES "Antecedents"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_RapportAnalyseID_fkey" FOREIGN KEY ("RapportAnalyseID") REFERENCES "RapportAnalyse"("ID_rapportAnalyse") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_AllergiesID_fkey" FOREIGN KEY ("AllergiesID") REFERENCES "Allergies"("ID_Allergies") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consultation" ADD CONSTRAINT "Consultation_OrdonnanceID_fkey" FOREIGN KEY ("OrdonnanceID") REFERENCES "Ordonnance"("IDOrdonnance") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consultation" ADD CONSTRAINT "Consultation_DossierMedicalID_fkey" FOREIGN KEY ("DossierMedicalID") REFERENCES "Dossier_Medical"("IDDossierMedical") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consultation" ADD CONSTRAINT "Consultation_MedecinID_fkey" FOREIGN KEY ("MedecinID") REFERENCES "Medecin"("IDMedecin") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Analyses" ADD CONSTRAINT "Analyses_ConsultationID_fkey" FOREIGN KEY ("ConsultationID") REFERENCES "Consultation"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Analyses" ADD CONSTRAINT "Analyses_LaboratoireID_fkey" FOREIGN KEY ("LaboratoireID") REFERENCES "Laboratoire"("IDLaboratoire") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ordonnance" ADD CONSTRAINT "Ordonnance_MedecinPrescripteurID_fkey" FOREIGN KEY ("MedecinPrescripteurID") REFERENCES "Pro_Sante"("ID_pro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RapportAnalyse" ADD CONSTRAINT "RapportAnalyse_LaboratoireID_fkey" FOREIGN KEY ("LaboratoireID") REFERENCES "Laboratoire"("IDLaboratoire") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Laboratoire" ADD CONSTRAINT "Laboratoire_ProSanteID_fkey" FOREIGN KEY ("ProSanteID") REFERENCES "Pro_Sante"("ID_pro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_ProID_fkey" FOREIGN KEY ("ProID") REFERENCES "Pro_Sante"("ID_pro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pro_Sante" ADD CONSTRAINT "Pro_Sante_UtilisateurID_fkey" FOREIGN KEY ("UtilisateurID") REFERENCES "Utilisateur"("IDutilisateur") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teleconsultation" ADD CONSTRAINT "Teleconsultation_MedecinID_fkey" FOREIGN KEY ("MedecinID") REFERENCES "Medecin"("IDMedecin") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teleconsultation" ADD CONSTRAINT "Teleconsultation_CreneauHoraireID_fkey" FOREIGN KEY ("CreneauHoraireID") REFERENCES "Creneau_horaire"("ID_Creneau") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Utilisateur" ADD CONSTRAINT "Utilisateur_RoleID_fkey" FOREIGN KEY ("RoleID") REFERENCES "Role"("IDRole") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compte_utilisateur" ADD CONSTRAINT "Compte_utilisateur_UtilisateurID_fkey" FOREIGN KEY ("UtilisateurID") REFERENCES "Utilisateur"("IDutilisateur") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_emetteurID_fkey" FOREIGN KEY ("emetteurID") REFERENCES "Compte_utilisateur"("IDCompte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_recepteurID_fkey" FOREIGN KEY ("recepteurID") REFERENCES "Compte_utilisateur"("IDCompte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disponibilite" ADD CONSTRAINT "Disponibilite_creneau_horaireID_fkey" FOREIGN KEY ("creneau_horaireID") REFERENCES "Creneau_horaire"("ID_Creneau") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disponibilite" ADD CONSTRAINT "Disponibilite_utilisateurID_fkey" FOREIGN KEY ("utilisateurID") REFERENCES "Utilisateur"("IDutilisateur") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Planning" ADD CONSTRAINT "Planning_CreneauDisponibleID_fkey" FOREIGN KEY ("CreneauDisponibleID") REFERENCES "Disponibilite"("IDDisponibilite") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Planning" ADD CONSTRAINT "Planning_Pro_santeID_fkey" FOREIGN KEY ("Pro_santeID") REFERENCES "Pro_Sante"("ID_pro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_DisponibiliteID_fkey" FOREIGN KEY ("DisponibiliteID") REFERENCES "Disponibilite"("IDDisponibilite") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Panier_demande" ADD CONSTRAINT "Panier_demande_ServiceID_fkey" FOREIGN KEY ("ServiceID") REFERENCES "Service"("IDService") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Panier_demande" ADD CONSTRAINT "Panier_demande_FactureID_fkey" FOREIGN KEY ("FactureID") REFERENCES "Facture"("IDFacture") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Facture" ADD CONSTRAINT "Facture_PaiementID_fkey" FOREIGN KEY ("PaiementID") REFERENCES "Paiement"("IDPaiement") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Demande_RendezVous" ADD CONSTRAINT "Demande_RendezVous_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES "Patient"("IDPatient") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Demande_RendezVous" ADD CONSTRAINT "Demande_RendezVous_ServiceID_fkey" FOREIGN KEY ("ServiceID") REFERENCES "Service"("IDService") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documents_Patient" ADD CONSTRAINT "Documents_Patient_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES "Patient"("IDPatient") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Suivi_Patient" ADD CONSTRAINT "Suivi_Patient_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES "Patient"("IDPatient") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DemandeUrgence" ADD CONSTRAINT "DemandeUrgence_PatientID_fkey" FOREIGN KEY ("PatientID") REFERENCES "Patient"("IDPatient") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DemandeUrgence" ADD CONSTRAINT "DemandeUrgence_Equipe_urgenceID_fkey" FOREIGN KEY ("Equipe_urgenceID") REFERENCES "Equipe_Urgence"("IDEquipe") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DemandeUrgence" ADD CONSTRAINT "DemandeUrgence_VehiculeID_fkey" FOREIGN KEY ("VehiculeID") REFERENCES "Vehicule"("IDVehicule") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommandeMedicaments" ADD CONSTRAINT "CommandeMedicaments_OrdonnanceID_fkey" FOREIGN KEY ("OrdonnanceID") REFERENCES "Ordonnance"("IDOrdonnance") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommandeMedicaments" ADD CONSTRAINT "CommandeMedicaments_PharmacieID_fkey" FOREIGN KEY ("PharmacieID") REFERENCES "Pharmacie"("ID_Pharmacie") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pro_Equipe" ADD CONSTRAINT "Pro_Equipe_ID_pro_fkey" FOREIGN KEY ("ID_pro") REFERENCES "Pro_Sante"("ID_pro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pro_Equipe" ADD CONSTRAINT "Pro_Equipe_IDEquipe_fkey" FOREIGN KEY ("IDEquipe") REFERENCES "Equipe_Urgence"("IDEquipe") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pro_Centre" ADD CONSTRAINT "Pro_Centre_ID_pro_fkey" FOREIGN KEY ("ID_pro") REFERENCES "Pro_Sante"("ID_pro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pro_Centre" ADD CONSTRAINT "Pro_Centre_ID_Centre_fkey" FOREIGN KEY ("ID_Centre") REFERENCES "Centre"("IDCentre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicule" ADD CONSTRAINT "Vehicule_CentreID_fkey" FOREIGN KEY ("CentreID") REFERENCES "Centre"("IDCentre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disponibilite_Vehicule" ADD CONSTRAINT "Disponibilite_Vehicule_VehiculeID_fkey" FOREIGN KEY ("VehiculeID") REFERENCES "Vehicule"("IDVehicule") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disponibilite_Vehicule" ADD CONSTRAINT "Disponibilite_Vehicule_Creneau_horaireID_fkey" FOREIGN KEY ("Creneau_horaireID") REFERENCES "Creneau_horaire"("ID_Creneau") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ligne_Commande" ADD CONSTRAINT "Ligne_Commande_CommandeID_fkey" FOREIGN KEY ("CommandeID") REFERENCES "CommandeMedicaments"("IDCommandeMedicaments") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ligne_Commande" ADD CONSTRAINT "Ligne_Commande_FactureID_fkey" FOREIGN KEY ("FactureID") REFERENCES "Facture_Commande"("IDFacture") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ligne_Commande" ADD CONSTRAINT "Ligne_Commande_LivraisonID_fkey" FOREIGN KEY ("LivraisonID") REFERENCES "Livraison"("ID_Livraison") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ligne_Commande" ADD CONSTRAINT "Ligne_Commande_ID_Ordonnance_fkey" FOREIGN KEY ("ID_Ordonnance") REFERENCES "Ordonnance"("IDOrdonnance") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Paiement_Commande" ADD CONSTRAINT "Paiement_Commande_Facture_Commande_ID_fkey" FOREIGN KEY ("Facture_Commande_ID") REFERENCES "Facture_Commande"("IDFacture") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Alerte" ADD CONSTRAINT "Alerte_Suivi_PatientID_fkey" FOREIGN KEY ("Suivi_PatientID") REFERENCES "Suivi_Patient"("IDSuiviPatient") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Equipe_UrgenceToPro_Sante" ADD CONSTRAINT "_Equipe_UrgenceToPro_Sante_A_fkey" FOREIGN KEY ("A") REFERENCES "Equipe_Urgence"("IDEquipe") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Equipe_UrgenceToPro_Sante" ADD CONSTRAINT "_Equipe_UrgenceToPro_Sante_B_fkey" FOREIGN KEY ("B") REFERENCES "Pro_Sante"("ID_pro") ON DELETE CASCADE ON UPDATE CASCADE;
