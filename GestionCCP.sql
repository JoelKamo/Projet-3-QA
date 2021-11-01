drop database if exists GestionCCP; 
Create database if not exists GestionCCP;


Create table if not exists Proprietaire(
Proprio_Nom varchar(100) unique not null,
Proprio_telephone varchar(12) not null,
Proprio_adresse varchar(100) not null,
Proprio_chiffreAffaire float not null,
PRIMARY KEY (Proprio_Nom)  
);


Create table if not exists Administrateur(
Admin_Nom varchar(100) unique not null,
Admin_telephone varchar(12) not null,
Admin_adresse varchar(100) not null,
PRIMARY KEY (Admin_Nom)
);

create table if not exists CCP(
CCP_Id int auto_increment not null,
CCP_Name varchar(100) not null,
CCP_adress varchar(100) not null ,
CCP_codePostal varchar(7) not null,
CCP_siteWeb varchar(100),
CCP_telephone varchar(12) not null,
CCP_telecopieur varchar(12) not null,
CCP_courriel varchar(100) not null,
CCP_Proprietaire varchar(100) not null,
CCP_Administrateur varchar(100) not null,
PRIMARY KEY ( CCP_Id ),
FOREIGN KEY(CCP_Proprietaire) REFERENCES Proprietaire( Proprio_Nom),
FOREIGN KEY(CCP_Administrateur) REFERENCES Administrateur( Admin_Nom)
);

Create Table if not exists Abonnement(
Abonnement_Id int auto_increment not null,
Abonnement_type int not null,
Abonnement_date DateTime not null,
Abonnement_tarrif int not null,
Abonnement_actif bool not null,
primary key(Abonnement_Id)

);

CREATE TABLE if not exists Membre(
Membre_Id int auto_increment not null,
Membre_nom varchar(100) not null,
Membre_adresse varchar(100) not null,
Id_Abonnement int not null,
PRIMARY KEY(Membre_Id) ,
FOREIGN KEY(Id_Abonnement) REFERENCES Abonnement(Abonnement_Id)
);

CREATE TABLE if not exists Abonne(
Abonne_Id int auto_increment not null,
Abonne_role varchar(100) not null,
Membre_Id int not null ,
PRIMARY KEY(Abonne_Id),
FOREIGN KEY(Membre_Id) REFERENCES Membre(Membre_Id)
);


CREATE TABLE if not exists Employe(
Employe_Id int auto_increment not null,
Employe_Nom varchar(100) not null,
Employe_Adresse varchar(100) not null,
Employe_telephone varchar(100) not null,
Employe_CCP int not null ,
PRIMARY KEY(Employe_Id),
FOREIGN KEY(Employe_CCP) REFERENCES CCP(CCP_Id)

);