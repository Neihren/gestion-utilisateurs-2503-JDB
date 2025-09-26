ALTER TABLE
	t_role
ADD COLUMN
	role_level INT NOT NULL DEFAULT '0';

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