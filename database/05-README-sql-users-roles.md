## Requêtes à implémenter (utilisateurs + rôles) 

1. Sélectionner tous les utilisateurs (identifiant nom, prénom, email et nom du rôle).

```sql
/* Sans jointure */

/* Avec jointure */

```

2. Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle). Trier les résultats par idetnfiant de rôle par ordre décroissant puis par nom de famille par ordre croissant.

```sql
/* Sans jointure */

/* Avec jointure */

```

3. Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle) qui possèdent le rôle n°2

```sql

```

5. Sélectionner le nombre d'utilisateurs.

```sql

```


5. Sélectionner, dans les rôles, le plus grand identifiant.

```sql

```



4. Sélectionner tous les rôles (identifiant du rôle, nom du rôle, description du rôle). Pour chaque rôle, afficher le nombre d'utilisateurs concernés.

Le résultat devrait ressembler à ceci  :

| role_id | role_name | role_description | nb_users |
| --- | --- | --- | --- |
| 1 | padawan | Les petits nouveaux | 2 |
| 2 | modérateur |  | 2 |
| 3 | administrateur | Les super pouvoirs | 1 |

```sql

```

6. Sélectionner la moyenne du nombre d'utilisateurs par rôle.

```sql

```

