## Requêtes UPDATE à implémenter (rôles) 

1. Modifier le nom du rôle n°2 en "Modérateur".

```sql
UPDATE t_role SET role_name='modérateur' WHERE role_id=2;
```

2. Modifier le rôle n°1.
    - Nouveau nom : padawan
    - Nouvelle description : Les petits nouveaux 

```sql
UPDATE t_role SET 
role_name='padawan', 
role_description='les petits nouveaux' 
WHERE role_id = '1';
```


## Requêtes SELECT à implémenter (rôles)

1. Sélectionner toutes les informations de tous les rôles.

```sql
/* (* = toutes les colonnes, non recommandé) */
SELECT * FROM t_role; 

/* Recommandé : sélectionner les colonnes */
SELECT role_id, role_name, role_description, role_register_code 
FROM t_role;
```

2. Sélectionner l'identifiant, le nom du rôle et la description de chaque rôle. Résultat trié par description

```sql
SELECT role_id, role_name, role_description 
FROM t_role 
ORDER BY role_description ASC;
```

3. Sélectionner l'identifiant et le nom du rôle n°3.

```sql
SELECT role_id, role_name 
FROM t_role 
WHERE role_id=3;
```

4. Sélectionner l'identifiant, le nom et la description du rôle dont le libellé est "modérateur".

```sql
SELECT role_id, role_name, role_description 
FROM t_role 
WHERE role_name = 'modérateur';
```

5. Sélectionner toutes les informations des rôles dont la description est vide.

```sql
SELECT role_id, role_name, role_description, role_register_code 
FROM t_role 
WHERE role_description IS NULL OR role_description = '';
```

6. Sélectionner toutes les informations des rôles dont la description n'est pas vide.

```sql
SELECT role_id, role_name, role_description, role_register_code 
FROM t_role 
WHERE role_description IS NOT NULL AND role_description <> '';
```

7. Sélectionner l'identifiant et le nom des rôles dont le nom contient la chaine "ra".

```sql
SELECT role_id, role_name 
FROM t_role 
WHERE role_name LIKE '%ra%';
```

8. Sélectionner l'identifiant, le nom et la description des rôles dont le nom se termine par la lettre "r".

```sql
SELECT role_id, role_name, role_description 
FROM t_role 
WHERE role_name LIKE '%r' AND role_description IS NOT NULL;
```

9 . Sélectionner l'identifiant, le nom et la description des rôles dont le nom commence par la lettre "r".

```sql
SELECT role_id, role_name, role_description 
FROM t_role 
WHERE role_name LIKE 'r%';
```