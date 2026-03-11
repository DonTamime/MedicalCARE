/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  11/03/2026 14:56:23                      */
/*==============================================================*/


alter table ANALYSE_SANG
   drop constraint FK_ANALYSE__FK_ANALYS_PATIENT;

alter table ANALYSE_SANG
   drop constraint FK_ANALYSE__REFERENCE_PERSONNE;

alter table ANALYSE_SANG
   drop constraint FK_ANALYSE__REFERENCE_VISITE_Q;

alter table EXAM_EEG
   drop constraint FK_EXAM_EEG_REFERENCE_PERSONNE;

alter table EXAM_EEG
   drop constraint FK_EXAM_EEG_REFERENCE_VISITE_Q;

alter table EXAM_EFFORT
   drop constraint FK_EXAM_EFF_REFERENCE_VISITE_Q;

alter table LOT_MEDICAMENT
   drop constraint FK_LOT_MEDI_FK_LOT_ME_PATIENT;

alter table LOT_MEDICAMENT
   drop constraint FK_LOT_MEDI_REFERENCE_PERSONNE;

alter table PATIENT
   drop constraint FK_PATIENT_FK_PATIEN_CENTRE;

alter table PATIENT
   drop constraint FK_PATIENT_REFERENCE_PERSONNE;

alter table PAT_DETAIL
   drop constraint FK_PAT_DETA_FK_PAT_D__PATIENT;

alter table VISITE_QUOTIDIENNE
   drop constraint FK_VISITE_Q_FK_VISITE_PATIENT;

alter table VISITE_QUOTIDIENNE
   drop constraint FK_VISITE_Q_REFERENCE_PERSONNE;

drop index REFERENCE_12_FK;

drop index REFERENCE_9_FK;

drop index FK_ANALYSE_SANG_PATIENT_FK;

drop table ANALYSE_SANG cascade constraints;

drop table CENTRE cascade constraints;

drop index REFERENCE_10_FK;

drop index REFERENCE_7_FK;

drop table EXAM_EEG cascade constraints;

drop index REFERENCE_8_FK;

drop table EXAM_EFFORT cascade constraints;

drop index REFERENCE_14_FK;

drop index FK_LOT_MEDICAMENT_PATIENT_FK;

drop table LOT_MEDICAMENT cascade constraints;

drop index REFERENCE_13_FK;

drop index FK_PATIENT_CENTRE_FK;

drop table PATIENT cascade constraints;

drop index FK_PAT_D_PATIENT_FK;

drop table PAT_DETAIL cascade constraints;

drop table PERSONNEL cascade constraints;

drop index REFERENCE_11_FK;

drop index FK_VISITE_Q_PATIENT_FK;

drop table VISITE_QUOTIDIENNE cascade constraints;

/*==============================================================*/
/* Table : ANALYSE_SANG                                         */
/*==============================================================*/
create table ANALYSE_SANG 
(
   ID_ANALYSE           INTEGER              not null,
   NUM_ADELI            INTEGER,
   ID_PATIENT           INTEGER              not null,
   ID_VISITE            INTEGER,
   DATE_PRELEVEMENT     DATE                 not null,
   CHOLESTEROL          NUMBER,
   GLYCEMIE             NUMBER,
   PLAQUETTES           NUMBER,
   GLOBULES_ROUGES      NUMBER,
   GLOBULES_BLANCS      NUMBER,
   HEMOGLOBINE          NUMBER,
   EST_A_REFAIRE        VARCHAR2(1),
   constraint PK_ANALYSE_SANG primary key (ID_ANALYSE)
);

/*==============================================================*/
/* Index : FK_ANALYSE_SANG_PATIENT_FK                           */
/*==============================================================*/
create index FK_ANALYSE_SANG_PATIENT_FK on ANALYSE_SANG (
   ID_PATIENT ASC
);

/*==============================================================*/
/* Index : REFERENCE_9_FK                                       */
/*==============================================================*/
create index REFERENCE_9_FK on ANALYSE_SANG (
   ID_VISITE ASC
);

/*==============================================================*/
/* Index : REFERENCE_12_FK                                      */
/*==============================================================*/
create index REFERENCE_12_FK on ANALYSE_SANG (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Table : CENTRE                                               */
/*==============================================================*/
create table CENTRE 
(
   ID_CENTRE            INTEGER              not null,
   NOM_CENTRE           VARCHAR2(100)        not null,
   VILLE                VARCHAR2(100),
   ARC_RESPONSABLE      VARCHAR2(100),
   constraint PK_CENTRE primary key (ID_CENTRE)
);

/*==============================================================*/
/* Table : EXAM_EEG                                             */
/*==============================================================*/
create table EXAM_EEG 
(
   ID_EEG               INTEGER              not null,
   ID_VISITE            INTEGER,
   NUM_ADELI            INTEGER,
   DATE_EEG             DATE                 not null,
   SCORE_NEUROLOGUE     INTEGER,
   constraint PK_EXAM_EEG primary key (ID_EEG)
);

/*==============================================================*/
/* Index : REFERENCE_7_FK                                       */
/*==============================================================*/
create index REFERENCE_7_FK on EXAM_EEG (
   ID_VISITE ASC
);

/*==============================================================*/
/* Index : REFERENCE_10_FK                                      */
/*==============================================================*/
create index REFERENCE_10_FK on EXAM_EEG (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Table : EXAM_EFFORT                                          */
/*==============================================================*/
create table EXAM_EFFORT 
(
   ID_EFFORT            INTEGER              not null,
   ID_VISITE            INTEGER,
   DATE_TEST            DATE                 not null,
   RYTHME_AVANT         INTEGER,
   RYTHME_APRES         INTEGER,
   RYTHME_REPOS_1MIN    INTEGER,
   constraint PK_EXAM_EFFORT primary key (ID_EFFORT)
);

/*==============================================================*/
/* Index : REFERENCE_8_FK                                       */
/*==============================================================*/
create index REFERENCE_8_FK on EXAM_EFFORT (
   ID_VISITE ASC
);

/*==============================================================*/
/* Table : LOT_MEDICAMENT                                       */
/*==============================================================*/
create table LOT_MEDICAMENT 
(
   NUM_LOT              INTEGER              not null,
   ID_PATIENT           INTEGER              not null,
   NUM_ADELI            INTEGER,
   JOUR_ETUDE           INTEGER,
   COMPOSITION          VARCHAR2(100),
   PRIS_EFFECTIVEMENT   VARCHAR2(1),
   constraint PK_LOT_MEDICAMENT primary key (NUM_LOT)
);

/*==============================================================*/
/* Index : FK_LOT_MEDICAMENT_PATIENT_FK                         */
/*==============================================================*/
create index FK_LOT_MEDICAMENT_PATIENT_FK on LOT_MEDICAMENT (
   ID_PATIENT ASC
);

/*==============================================================*/
/* Index : REFERENCE_14_FK                                      */
/*==============================================================*/
create index REFERENCE_14_FK on LOT_MEDICAMENT (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Table : PATIENT                                              */
/*==============================================================*/
create table PATIENT 
(
   ID_PATIENT           INTEGER              not null,
   ID_CENTRE            INTEGER,
   NUM_ADELI            INTEGER,
   NOM_PATIENT          VARCHAR2(100)        not null,
   PRENOM_PATIENT       VARCHAR2(100),
   DATE_NAISSANCE       DATE                 not null,
   SEXE                 VARCHAR2(1),
   TAILLE_CM            NUMBER,
   POIDS_KG             NUMBER,
   GROUPE_ETUDE         VARCHAR2(2),
   SOUS_GROUPE          INTEGER,
   MEDECIN_REFERENT     INTEGER,
   constraint PK_PATIENT primary key (ID_PATIENT)
);

/*==============================================================*/
/* Index : FK_PATIENT_CENTRE_FK                                 */
/*==============================================================*/
create index FK_PATIENT_CENTRE_FK on PATIENT (
   ID_CENTRE ASC
);

/*==============================================================*/
/* Index : REFERENCE_13_FK                                      */
/*==============================================================*/
create index REFERENCE_13_FK on PATIENT (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Table : PAT_DETAIL                                           */
/*==============================================================*/
create table PAT_DETAIL 
(
   ID_PATHO             INTEGER              not null,
   ID_PATIENT           INTEGER              not null,
   NOM_PATHOLOGIE       VARCHAR2(100),
   DATE_DIAGNOSTIC      DATE,
   EST_EXCLUANTE        VARCHAR2(1),
   constraint PK_PAT_DETAIL primary key (ID_PATHO)
);

/*==============================================================*/
/* Index : FK_PAT_D_PATIENT_FK                                  */
/*==============================================================*/
create index FK_PAT_D_PATIENT_FK on PAT_DETAIL (
   ID_PATIENT ASC
);

/*==============================================================*/
/* Table : PERSONNEL                                            */
/*==============================================================*/
create table PERSONNEL 
(
   NUM_ADELI            INTEGER              not null,
   NOM                  VARCHAR2(100)        not null,
   PRENOM               VARCHAR2(100),
   SPECIALITE           VARCHAR2(100),
   TYPE_METIER          VARCHAR2(50),
   constraint PK_PERSONNEL primary key (NUM_ADELI)
);

/*==============================================================*/
/* Table : VISITE_QUOTIDIENNE                                   */
/*==============================================================*/
create table VISITE_QUOTIDIENNE 
(
   ID_VISITE            INTEGER              not null,
   ID_PATIENT           INTEGER              not null,
   NUM_ADELI            INTEGER,
   DATE_VISITE          DATE,
   NUM_CHAMBRE          INTEGER,
   POIDS_JOUR           NUMBER,
   TENSION_SYST         INTEGER,
   TENSION_DIAST        INTEGER,
   RYTHME_CARDIAQUE     INTEGER,
   TEMPERATURE          NUMBER,
   OBSERVATIONS         VARCHAR2(1000),
   ID_MEDECIN_VALIDATEUR INTEGER,
   constraint PK_VISITE_QUOTIDIENNE primary key (ID_VISITE)
);

/*==============================================================*/
/* Index : FK_VISITE_Q_PATIENT_FK                               */
/*==============================================================*/
create index FK_VISITE_Q_PATIENT_FK on VISITE_QUOTIDIENNE (
   ID_PATIENT ASC
);

/*==============================================================*/
/* Index : REFERENCE_11_FK                                      */
/*==============================================================*/
create index REFERENCE_11_FK on VISITE_QUOTIDIENNE (
   NUM_ADELI ASC
);

alter table ANALYSE_SANG
   add constraint FK_ANALYSE__FK_ANALYS_PATIENT foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT);

alter table ANALYSE_SANG
   add constraint FK_ANALYSE__REFERENCE_PERSONNE foreign key (NUM_ADELI)
      references PERSONNEL (NUM_ADELI);

alter table ANALYSE_SANG
   add constraint FK_ANALYSE__REFERENCE_VISITE_Q foreign key (ID_VISITE)
      references VISITE_QUOTIDIENNE (ID_VISITE);

alter table EXAM_EEG
   add constraint FK_EXAM_EEG_REFERENCE_PERSONNE foreign key (NUM_ADELI)
      references PERSONNEL (NUM_ADELI);

alter table EXAM_EEG
   add constraint FK_EXAM_EEG_REFERENCE_VISITE_Q foreign key (ID_VISITE)
      references VISITE_QUOTIDIENNE (ID_VISITE);

alter table EXAM_EFFORT
   add constraint FK_EXAM_EFF_REFERENCE_VISITE_Q foreign key (ID_VISITE)
      references VISITE_QUOTIDIENNE (ID_VISITE);

alter table LOT_MEDICAMENT
   add constraint FK_LOT_MEDI_FK_LOT_ME_PATIENT foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT);

alter table LOT_MEDICAMENT
   add constraint FK_LOT_MEDI_REFERENCE_PERSONNE foreign key (NUM_ADELI)
      references PERSONNEL (NUM_ADELI);

alter table PATIENT
   add constraint FK_PATIENT_FK_PATIEN_CENTRE foreign key (ID_CENTRE)
      references CENTRE (ID_CENTRE);

alter table PATIENT
   add constraint FK_PATIENT_REFERENCE_PERSONNE foreign key (NUM_ADELI)
      references PERSONNEL (NUM_ADELI);

alter table PAT_DETAIL
   add constraint FK_PAT_DETA_FK_PAT_D__PATIENT foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT);

alter table VISITE_QUOTIDIENNE
   add constraint FK_VISITE_Q_FK_VISITE_PATIENT foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT);

alter table VISITE_QUOTIDIENNE
   add constraint FK_VISITE_Q_REFERENCE_PERSONNE foreign key (NUM_ADELI)
      references PERSONNEL (NUM_ADELI);

CREATE OR REPLACE TRIGGER TRG_SECURITE_AGE_45
BEFORE INSERT OR UPDATE ON PATIENT
FOR EACH ROW
DECLARE
   v_age NUMBER;
BEGIN
   -- 1. On calcule l'âge à partir de la date de naissance saisie
   v_age := floor(months_between(sysdate, :NEW.DATE_NAISSANCE) / 12);

   -- 2. La condition combinée :
   -- SI le patient a plus de 45 ans
   -- ET qu'il n'est PAS dans le groupe témoin (PP)
   -- ET qu'il est dans le sous-groupe 1 (traitement quotidien complet)
   IF v_age > 45 AND :NEW.GROUPE_ETUDE != 'PP' AND :NEW.SOUS_GROUPE = 1 THEN
      
      RAISE_APPLICATION_ERROR(-20006, 
         'ERREUR PROTOCOLE : Un patient de plus de 45 ans (' || v_age || ' ans) ' ||
         'ne peut pas être dans le sous-groupe 1 d''un groupe actif.');
         
   END IF;
END;
/




