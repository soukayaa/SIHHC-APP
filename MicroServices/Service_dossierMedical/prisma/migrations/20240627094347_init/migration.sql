-- CreateTable
CREATE TABLE "Dossier_Medical" (
    "IDDossierMedical" SERIAL NOT NULL,
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
CREATE TABLE "Allergies" (
    "ID_Allergies" SERIAL NOT NULL,
    "Type" TEXT NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Allergies_pkey" PRIMARY KEY ("ID_Allergies")
);

-- CreateTable
CREATE TABLE "Antecedents" (
    "ID" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Antecedents_pkey" PRIMARY KEY ("ID")
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
CREATE TABLE "Correspondant" (
    "ID" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Specialite" TEXT NOT NULL,
    "Contact" TEXT NOT NULL,

    CONSTRAINT "Correspondant_pkey" PRIMARY KEY ("ID")
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
CREATE TABLE "Traitement" (
    "Identifiant" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,
    "Date_debut" TIMESTAMP(3) NOT NULL,
    "Date_fin" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Traitement_pkey" PRIMARY KEY ("Identifiant")
);

-- CreateTable
CREATE TABLE "Pathologie" (
    "ID" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Pathologie_pkey" PRIMARY KEY ("ID")
);

-- CreateIndex
CREATE UNIQUE INDEX "Consultation_OrdonnanceID_key" ON "Consultation"("OrdonnanceID");

-- CreateIndex
CREATE UNIQUE INDEX "Analyses_ConsultationID_key" ON "Analyses"("ConsultationID");

-- AddForeignKey
ALTER TABLE "Dossier_Medical" ADD CONSTRAINT "Dossier_Medical_PersonneEntourageID_fkey" FOREIGN KEY ("PersonneEntourageID") REFERENCES "PersonneEntourage"("ID_PersonneEntourage") ON DELETE RESTRICT ON UPDATE CASCADE;

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
ALTER TABLE "Analyses" ADD CONSTRAINT "Analyses_ConsultationID_fkey" FOREIGN KEY ("ConsultationID") REFERENCES "Consultation"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;
