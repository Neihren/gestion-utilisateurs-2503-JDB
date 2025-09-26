/* Modifier la table t_role. 
Ajouter une colonne role_level (nombre entier, obligatoire, valeur par défaut: 0). 
La colonne "role_level" permettra de connaitre le niveau d'autorisation du rôle. */

ALTER TABLE t_role 
	ADD COLUMN role_level INT NOT NULL DEFAULT '0';
	
/*
Mettre à jour le niveau de chaque rôle :
role_id	role_level
1 ->	0
2	-> 9
3	-> 10
*/

UPDATE t_role SET role_level=0 WHERE role_id=1;

UPDATE t_role SET role_level=9 WHERE role_id=2;

UPDATE t_role SET role_level=10 WHERE role_id=3;

/*
3. Ajouter les rôles suivants : 

| role_name | role_description | role_level | role_register_code
| --- | --- | --- | --- |
| employé | Les salariés | 1 | 7896 | 
| cadre | Les managers | 2 | asd44 |
| dirigeant | La Big Boss | 8 | 4561 |
*/

INSERT INTO t_role 
(role_name, role_description, role_level, role_register_code)
VALUES 
('employé', 'les salariés', '1', '7896'),
('cadre', 'les managers', '2', 'asd44'),
('dirigeant', 'la big boss', '3', '4561');
	

