-- Sélectionner tous les utilisateurs (identifiant, nom, prénom, email et nom du rôle).

-- Sans jointure
SELECT
	user_id,
	user_lastname,
	user_firstname,
	user_email,
	role_name
FROM
	t_user,
	t_role
WHERE
	t_user.role_id = t_role.role_id;

-- Avec jointure

SELECT
	user_id,
	user_lastname,
	user_firstname,
	user_email,
	role_name
FROM
	t_user
INNER JOIN 
	t_role 
ON 
	t_user.role_id = t_role.role_id;

-- Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle).
--	Trier les résultats par identifiant de rôle par ordre décroissant puis par nom de famille par ordre croissant.

-- Sans jointure

SELECT
	user_id,
	user_lastname,
	user_firstname,
	user_email,
	t_user.role_id AS role_id,
	role_name
FROM
	t_user,
	t_role
WHERE
	t_user.role_id = t_role.role_id;
ORDER BY
	role_id DESC,
	user_lastname ASC;

-- Avec jointure

SELECT
	user_id,
	user_lastname,
	user_firstname,
	user_email,
	t_user.role_id,
	role_name
FROM
	t_user
INNER JOIN 
	t_role 
ON 
	t_user.role_id = t_role.role_id
ORDER BY
	t_role.role_id DESC,
	user_lastname ASC;

-- Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle) qui possèdent le rôle n°2

SELECT
	user_id,
	user_lastname,
	user_firstname,
	user_email,
	t_user.role_id AS role_id,
	role_name
FROM
	t_user,
	t_role
WHERE
	t_user.role_id = t_role.role_id
	AND role_id = 2;


-- Sélectionner le nombre d'utilisateurs.

SELECT
	COUNT(*)
FROM
	t_user;

-- Sélectionner, dans les rôles, le plus grand identifiant.

SELECT
	MAX(role_id)
FROM
	t_role;

-- Sélectionner tous les rôles (identifiant du rôle, nom du rôle, description du rôle). Pour chaque rôle, afficher le nombre d'utilisateurs concernés.
-- Le résultat devrait ressembler à ceci :

-- +-----------+-----------------+-----------------------+-----------+
-- |	role_id	|	role_name		|	role_description		|	nb_users	|
-- +-----------+-----------------+-----------------------+-----------+
-- |	1			|	padawan			|	Les petits nouveaux	|	2			|
-- |	2			|	modérateur		|								|	2			|
-- |	3			|	administrateur	|	Les super pouvoirs	|	1			|
-- +-----------+-----------------+-----------------------+-----------+

SELECT
	t_role.role_id,
	role_name,
	role_description,
	COUNT(t_user.user_id) AS nb_users
FROM
	t_role
INNER JOIN
	t_user ON t_user.role_id = t_role.role_id
GROUP BY
	t_role.role_id;

-- Sélectionner la moyenne du nombre d'utilisateurs par rôle.

SELECT(
	SELECT COUNT(user_id)
	FROM t_user
	)/(
	SELECT COUNT(role_id)
	FROMt_role
	)
	AS 'Moyenne utilisateurs par rôles';
	
/* SELECT
	role_name AS 'Rôle',
	CAST(COUNT(user_id) / SUM(COUNT(user_id)) OVER() * 100 AS UNSIGNED) AS 'Pourcentage d\'utilisateurs'
FROM
	t_role
INNER JOIN
	t_user
	ON t_user.role_id = t_role.role_id
GROUP BY
	role_name; */
	
-- NEW
TRUNCATE TABLE t_user;
INSERT INTO `t_user` (`user_id`, `user_email`, `user_lastname`, `user_firstname`, `user_password`, `role_id`) VALUES
	(1, 'daniel@example.com', 'hatcher', 'daniel', 'tatayoyo', 1),
	(2, 'bertrand@example.com', 'dion', 'richard', '123456', 1),
	(3, 'germaine.lustrucru@example.fr', 'lustucru', NULL, '1234', 2),	
	(5, 'celine@example.com', 'dion', 'céline', 'rené', 2),
	(6, 'toto@example.fr', 'ingals', 'charles', 'azerty', 3),
	(8, 'a@a.fr', 'toto', 'tata', '1234', 2),
	(12, 'ab@a.fr', 'totob', 'tatab', '1234', 1);


	
SELECT 
	U.user_id,
	U.user_email,
   U.user_lastname,
   U.user_firstname,
   R.role_name,
   U2.user_lastname AS user_2_lastname,
   U2.user_id AS user_2_id
FROM 
   t_user U
INNER JOIN 
   t_role R ON U.role_id = R.role_id
INNER JOIN 
   t_user U2 ON U.role_id = U2.role_id
WHERE 
   U2.user_id = (
      SELECT MIN(U3.user_id)
      FROM t_user U3
      WHERE U3.role_id = U.role_id
   )
;

-- OLD
TRUNCATE TABLE t_user;
INSERT INTO `t_user` (`user_id`, `user_email`, `user_lastname`, `user_firstname`, `user_password`, `role_id`) VALUES
	(1, 'toto@example.fr', 'ingals', 'charles', 'azerty', 3),
	(2, 'bertrand@example.com', 'macron', 'richard', '123456', 1),
	(3, 'germaine.lustrucru@example.fr', 'lustucru', NULL, '1234', 2),
	(4, 'daniel@example.com', 'Hatcher', 'daniel', '4be3b3a4ad275152d7d6cbddda41a6e1', 1),
	(5, 'celine@example.com', 'dion', 'céline', 'rené', 2),
	(6, 'ella.danloss@example.com', 'Danloss', 'Ella', '12345', 4),
	(7, 'j.golay@example.fr', 'Golay', 'Jerry', 'azerty', 4),
	(8, 'medhi@example.fr', 'Camant', 'Medhi', 'password', 5),
	(9, 'aj@example.com', 'Javelle', 'Aude', '121180', 4),
	(10, 'jescr@example.fr', 'Scroute', 'Jessica', '231297', 6);