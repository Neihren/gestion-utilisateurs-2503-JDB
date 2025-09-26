-- Sélectionner tous les utilisateurs (identifiant, nom, prénom, email et nom du rôle).

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

-- Sans jointure

-- Avec jointure

-- Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle).
--	Trier les résultats par identifiant de rôle par ordre décroissant puis par nom de famille par ordre croissant.

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

-- Sans jointure

-- Avec jointure

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
	t_user,
	t_role
WHERE
	t_user.role_id = t_role.role_id
GROUP BY
	t_role.role_id;

-- Sélectionner la moyenne du nombre d'utilisateurs par rôle.

SELECT
	role_name
	AVG()