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

alter table PATHOLOGIE_DETAIL
   drop constraint FK_PATHOLOG_FK_PATHOL_PATIENT;

alter table PATIENT
   drop constraint FK_PATIENT_FK_PATIEN_CENTRE;

alter table PATIENT
   drop constraint FK_PATIENT_REFERENCE_PERSONNE;

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

drop index FK_PATH_DETAIL_PATIENT_FK;

drop table PATHOLOGIE_DETAIL cascade constraints;

drop index REFERENCE_13_FK;

drop index FK_PATIENT_CENTRE_FK;

drop table PATIENT cascade constraints;

drop table PERSONNEL cascade constraints;

drop index REFERENCE_11_FK;

drop index FK_VISITE_PATIENT_FK;

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
   CHOLESTEROL          VARCHAR,
   GLYCEMIE             VARCHAR,
   PLAQUETTES           VARCHAR,
   GLOBULES_ROUGES      VARCHAR,
   GLOBULES_BLANCS      VARCHAR,
   HEMOGLOBINE          VARCHAR,
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
/* Table : PATHOLOGIE_DETAIL                                    */
/*==============================================================*/
create table PATHOLOGIE_DETAIL 
(
   ID_PATHO             INTEGER              not null,
   ID_PATIENT           INTEGER              not null,
   NOM_PATHOLOGIE       VARCHAR2(100),
   DATE_DIAGNOSTIC      DATE,
   EST_EXCLUANTE        VARCHAR2(1),
   constraint PK_PATHOLOGIE_DETAIL primary key (ID_PATHO)
);

/*==============================================================*/
/* Index : FK_PATH_DETAIL_PATIENT_FK                            */
/*==============================================================*/
create index FK_PATH_DETAIL_PATIENT_FK on PATHOLOGIE_DETAIL (
   ID_PATIENT ASC
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
   TAILLE_CM            VARCHAR,
   POIDS_KG             VARCHAR,
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
   POIDS_JOUR           VARCHAR,
   TENSION_SYST         INTEGER,
   TENSION_DIAST        INTEGER,
   RYTHME_CARDIAQUE     INTEGER,
   TEMPERATURE          VARCHAR,
   OBSERVATIONS         VARCHAR2(1000),
   ID_MEDECIN_VALIDATEUR INTEGER,
   constraint PK_VISITE_QUOTIDIENNE primary key (ID_VISITE)
);

/*==============================================================*/
/* Index : FK_VISITE_PATIENT_FK                                 */
/*==============================================================*/
create index FK_VISITE_PATIENT_FK on VISITE_QUOTIDIENNE (
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

alter table PATHOLOGIE_DETAIL
   add constraint FK_PATHOLOG_FK_PATHOL_PATIENT foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT);

alter table PATIENT
   add constraint FK_PATIENT_FK_PATIEN_CENTRE foreign key (ID_CENTRE)
      references CENTRE (ID_CENTRE);

alter table PATIENT
   add constraint FK_PATIENT_REFERENCE_PERSONNE foreign key (NUM_ADELI)
      references PERSONNEL (NUM_ADELI);

alter table VISITE_QUOTIDIENNE
   add constraint FK_VISITE_Q_FK_VISITE_PATIENT foreign key (ID_PATIENT)
      references PATIENT (ID_PATIENT);

alter table VISITE_QUOTIDIENNE
   add constraint FK_VISITE_Q_REFERENCE_PERSONNE foreign key (NUM_ADELI)
      references PERSONNEL (NUM_ADELI);