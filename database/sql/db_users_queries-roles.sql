/* Modifier le nom du rôle n°2 en "modérateur". */

UPDATE t_role SET role_name='modérateur' WHERE role_id=2;

/* Modifier le rôle n°1.
	Nouveau nom : padawan
	Nouvelle description : Les petits nouveaux */
	
UPDATE t_role SET 
role_name='padawan', 
role_description='les petits nouveaux' 
WHERE role_id = '1';

/* Sélectionner toutes les informations de tous les rôles. */

SELECT * FROM t_role; /* (* = toutes les colonnes) */

SELECT role_id, role_name, role_description, role_register_code FROM t_role ORDER BY role_description DESC , role_name ASC;

/* Sélectionner l'identifiant, le nom du rôle et la description de chaque rôle. */

SELECT role_id, role_name, role_description FROM t_role ORDER BY role_description DESC;

/* Sélectionner l'identifiant et le nom du rôle n°3. */

SELECT role_id, role_name FROM t_role WHERE role_id=3;

/* Sélectionner l'identifiant, le nom et la description du rôle dont le libellé est "modérateur". */

SELECT role_id, role_name, role_description FROM t_role WHERE role_name = 'modérateur';

/* Sélectionner toutes les informations des rôles dont la description est vide. */

SELECT role_id, role_name, role_description, role_register_code FROM t_role WHERE role_description IS NULL OR role_description = '';

/* Sélectionner toutes les informations des rôles dont la description n'est pas vide. */

SELECT role_id, role_name, role_description, role_register_code FROM t_role WHERE role_description IS NOT NULL AND role_description <> '';

/* Sélectionner l'identifiant et le nom des rôles dont le nom contient la chaine "ra". */

SELECT role_id, role_name FROM t_role WHERE role_name LIKE '%ra%';

/* Sélectionner l'identifiant, le nom et la description des rôles dont le nom se termine par la lettre "r". */

SELECT role_id, role_name, role_description FROM t_role WHERE role_name LIKE '%r' AND role_description IS NOT NULL;

/* Sélectionner l'identifiant, le nom et la description des rôles dont le nom commence par la lettre "r". */

SELECT role_id, role_name, role_description FROM t_role WHERE role_name LIKE 'r%';

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