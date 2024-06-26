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
CREATE TABLE "Creneau_horaire" (
    "ID_Creneau" SERIAL NOT NULL,
    "heure_debut" TIMESTAMP(3) NOT NULL,
    "heure_fin" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Creneau_horaire_pkey" PRIMARY KEY ("ID_Creneau")
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
CREATE TABLE "Compte_utilisateur" (
    "IDCompte" SERIAL NOT NULL,
    "Pseudo" TEXT NOT NULL,
    "MotDePasse" TEXT NOT NULL,
    "UtilisateurID" INTEGER NOT NULL,

    CONSTRAINT "Compte_utilisateur_pkey" PRIMARY KEY ("IDCompte")
);

-- CreateTable
CREATE TABLE "Role" (
    "IDRole" SERIAL NOT NULL,
    "Libelle" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("IDRole")
);

-- CreateIndex
CREATE UNIQUE INDEX "Message_emetteurID_key" ON "Message"("emetteurID");

-- CreateIndex
CREATE UNIQUE INDEX "Message_recepteurID_key" ON "Message"("recepteurID");

-- CreateIndex
CREATE UNIQUE INDEX "Compte_utilisateur_UtilisateurID_key" ON "Compte_utilisateur"("UtilisateurID");

-- AddForeignKey
ALTER TABLE "Utilisateur" ADD CONSTRAINT "Utilisateur_RoleID_fkey" FOREIGN KEY ("RoleID") REFERENCES "Role"("IDRole") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disponibilite" ADD CONSTRAINT "Disponibilite_creneau_horaireID_fkey" FOREIGN KEY ("creneau_horaireID") REFERENCES "Creneau_horaire"("ID_Creneau") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disponibilite" ADD CONSTRAINT "Disponibilite_utilisateurID_fkey" FOREIGN KEY ("utilisateurID") REFERENCES "Utilisateur"("IDutilisateur") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_emetteurID_fkey" FOREIGN KEY ("emetteurID") REFERENCES "Compte_utilisateur"("IDCompte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_recepteurID_fkey" FOREIGN KEY ("recepteurID") REFERENCES "Compte_utilisateur"("IDCompte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compte_utilisateur" ADD CONSTRAINT "Compte_utilisateur_UtilisateurID_fkey" FOREIGN KEY ("UtilisateurID") REFERENCES "Utilisateur"("IDutilisateur") ON DELETE RESTRICT ON UPDATE CASCADE;
