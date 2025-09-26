-- Modifier la table t_role. Ajouter une colonne role_level (nombre entier, obligatoire, valeur par défaut: 0). La colonne "role_level" permettra de connaitre le niveau d'autorisation du rôle.

ALTER TABLE
	t_role
ADD COLUMN
	role_level INT NOT NULL DEFAULT '0';

-- Mettre à jour le niveau de chaque rôle :
-- +-----------+--------------+
-- |	role_id	|	role_level	|
-- +-----------+--------------+
-- |	1			|	0				|
-- |	2			|	9				|
-- |	3			|	10				|
-- +-----------+--------------+

UPDATE
	t_role
SET
	role_level = 0
WHERE
	role_id = 1;
	
UPDATE
	t_role
SET
	role_level = 9
WHERE
	role_id = 2;
	
UPDATE
	t_role
SET
	role_level = 10
WHERE
	role_id = 3;

--		Ajouter les rôles suivants :
--		+-----------+--------------------+--------------+-----------------------+
-- 	|role_name	|	role_description	|	role_level	|	role_register_code	|
-- 	+-----------+--------------------+--------------+-----------------------+
-- 	|employé		|	Les salariés		|	1				|	7896						|
-- 	|cadre		|	Les managers		|	2				|	asd44						|
-- 	|dirigeant	|	La Big Boss			|	8				|	4561						|
-- 	+-----------+--------------------+--------------+-----------------------+

INSERT INTO
	t_role (
	   role_name,
	   role_description,
	   role_level,
      role_register_code)
VALUES
	('employé', 'Les salariés', '1', '7896'),
	('cadre', 'Les managers', '2', 'asd44'),
	('dirigeant', 'la big boss', '3', '4561');

-- 	Ajouter les 5 utilisateurs suivants :
--		+-----------------+-----------------+-----------------------------+-----------------+--------------+
-- 	|	user_lastname	|	user_firstname	|	user_email						|	user_password	|	role_name	|
--		+-----------------+-----------------+-----------------------------+-----------------+--------------+
-- 	|	Danloss			|	Ella				|	ella.danloss@example.com	|	12345				|	employé		|
-- 	|	Golay				|	Jerry				|	j.golay@example.fr			|	azerty			|	employé		| 
-- 	|	Camant			|	Medhi				|	medhi@example.fr				|	password			|	cadre			|
-- 	|	Javelle			|	Aude				|	aj@example.com					|	121180			|	employé		|
-- 	|	Scroute			|	Jessica			|	jescr@example.fr				|	231297			|	dirigeant	|
--		+-----------------+-----------------+-----------------------------+-----------------+--------------+

INSERT INTO
	t_user (
	   user_lastname,
	   user_firstname,
	   user_email,
      user_password,
		role_id)
VALUES
	('Danloss', 'Ella', 'ella.danloss@example.com', '12345', (	SELECT
																						role_id
																					FROM
																						t_role
																					WHERE
																						role_name = 'employé')),
	('Golay', 'Jerry', 'j.golay@example.fr', 'azerty', (	SELECT
																				role_id
																			FROM
																				t_role
																			WHERE
																				role_name = 'employé')),
	('Camant', 'Medhi', 'medhi@example.fr', 'password', (	SELECT
																				role_id
																			FROM
																				t_role
																			WHERE
																				role_name = 'cadre')),
	('Javelle', 'Aude', 'aj@example.com', '121180', (	SELECT
																			role_id
																		FROM
																			t_role
																		WHERE
																			role_name = 'employé')),
	('Scroute', 'Jessica', 'jescr@example.fr', '231297', (	SELECT
																					role_id
																				FROM
																					t_role
																				WHERE
																					role_name = 'dirigeant'));
