# Mise à jour de la table rôles

1. Modifier la table `t_role`. Ajouter une colonne `role_level` (nombre entier, obligatoire, valeur par défaut: 0). La colonne "role_level" permettra de connaitre le niveau d'autorisation du rôle.

```sql

```

2. Mettre à jour le niveau de chaque rôle : 

| role_id | role_level |
| --- | --- |
| 1 | 0 |
| 2 | 9 |
| 3 | 10 |

```sql

```


3. Ajouter les rôles suivants : 

| role_name | role_description | role_level | role_register_code
| --- | --- | --- | --- |
| employé | Les salariés | 1 | 7896 | 
| cadre | Les managers | 2 | asd44 |
| dirigeant | La Big Boss | 8 | 4561 |

```sql

```

# Ajout de données dans la base actuelle

1. Ajouter les 5 utilisateurs suivants 

| user_lastname | user_firstname | user_email | user_password | role_name |  
| --- | --- | --- | --- | --- | 
| Danloss | Ella | ella.danloss@example.com | 12345 | employé |  
| Golay | Jerry | j.golay@example.fr | azerty | employé |  
| Camant | Medhi | medhi@example.fr | password | cadre |  
| Javelle | Aude | aj@example.com | 121180 | employé |  
| Scroute | Jessica | jescr@example.fr | 231297 | dirigeant |  


```sql

```
