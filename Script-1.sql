CREATE DATABASE university;

-- faccio partire il data base indicato in questo caso university
USE university;

-- creo prima tabella
CREATE TABLE `dipartimenti`(
    `id`INT NOT NULL AUTO_INCREMENT,
    `nome`VARCHAR(30) NOT NULL,
    `ìndirizzo`VARCHAR(40),
    `telefono` VARCHAR(10) NOT NULL,
    `email`VARCHAR(30) NOT NULL,
   `direttore`VARCHAR(30) NOT NULL,
   `amministratore`VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)   
);

-- creo tabella corsi di laurea 
CREATE TABLE `corsi_laurea` (
    `id`INT NOT NULL AUTO_INCREMENT,
    `nome`VARCHAR(30) NOT NULL,
    `sede`VARCHAR(40),
    `classe` VARCHAR(10) NOT NULL,
    `anni_attivi`SMALLINT NOT NULL,
    `coordinatore`VARCHAR(30) NOT NULL,
    `vicecoordinatore`VARCHAR(30) NOT NULL,
    `segretario`VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)   
    
);

-- aggiungo foreign key



-- CREO TABELLA CORSI
CREATE TABLE `corsi` (
    id INT NOT NULL AUTO_INCREMENT,
    `nome`VARCHAR(30) NOT NULL,
    `ore_previste`INT NOT NULL, 
    PRIMARY KEY (id)
    
);

-- creo tabella studenti
CREATE TABLE `studente`(
    `matricola`BIGINT NOT NULL AUTO_INCREMENT,
    `nome`VARCHAR(30) NOT NULL,
    `cognome`VARCHAR(30) NOT NULL, 
    `cf`VARCHAR(30) NOT NULL,
    `email`VARCHAR(30) NOT NULL,
    id_cdl INT NOT NULL,
    PRIMARY KEY (matricola),
    FOREIGN KEY(id_cdl) REFERENCES corsi_laurea(id)
);

-- creo tabella insegnanti
CREATE TABLE `insegnanti`(
    `ìd` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(30) NOT NULL,
    `cognome`VARCHAR(30) NOT NULL, 
    `cf`VARCHAR(30) NOT NULL,
    `email`VARCHAR(30) NOT NULL,
    `sede_ufficio`VARCHAR(30) NOT NULL,
    PRIMARY KEY (`ìd`)
);


-- tabella ponte tra corsi laurea e corsi
CREATE TABLE `cdl_corsi`(
    id_cdl INT NOT NULL,
    id_corsi INT NOT NULL,
    FOREIGN KEY(id_cdl) REFERENCES corsi_laurea(id),
    FOREIGN KEY(id_corsi) REFERENCES corsi(id)

);

-- tabella ponte tra corsi e insegnangti
-- non capisco perchè mi da errore credo che sia perche nella tabella insegnante e nella tabella corsi ho messo id tra i back tick
--  tra i back tick e qui non riesco a d inserirli
CREATE TABLE `corsi_insegnanti`(
    `id_corsi` INT NOT NULL,
    `id_insegnanti` INT NOT NULL,
    FOREIGN KEY(id_corsi) REFERENCES corsi(id),
    FOREIGN KEY(id_insegnanti) REFERENCES insegnanti(id)
);

ALTER TABLE studenti ADD FOREIGN KEY (id_corsi_laurea) references corsi_laurea(id)

ALTER TABLE corsi_laurea ADD COLUMN id_dipartimenti INT;
ALTER TABLE corsi_laurea ADD FOREIGN KEY(id_dipartimenti) REFERENCES dipartimenti(id)


INSERT INTO university, dipartimenti (nome, indirizzo, telefono, email, direttore, amministratore)
VALUES ('galiani', 'via mammamia', 09876353373, 'ciao@bello.com', 'ciro', 'pablo')

INSERT INTO university.corsi_laurea
(nome, sede, classe, anni_attivi, coordinatore, vicecoordinatore, segretario)
VALUES('medicina', 'via difficile', 'c5', 3, 'peppe', 'gina', 'carmela');


-- creo corso
INSERT INTO university.corsi
(nome, ore_previste)
VALUES('cardiologia', 50);
-- inserisco altro corso
INSERT INTO university.corsi
(nome, ore_previste)
VALUES('psichiatria', 40);

-- tabella ponte
INSERT INTO university.cdl_corsi
(id_cdl, id_corsi)
VALUES(1, 1);

INSERT INTO university.cdl_corsi
(id_cdl, id_corsi)
VALUES(1, 2);