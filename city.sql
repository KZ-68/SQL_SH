-- 1. Obtenir la liste des 10 villes les plus peuplées en 2012
SELECT
    ville_nom,
    ville_population_2012
FROM 
	villes_france_free
ORDER BY 
    ville_population_2012 DESC
LIMIT 10

-- 2. Obtenir la liste des 50 villes ayant la plus faible superficie
SELECT
    ville_nom,
    ville_surface
FROM 
	villes_france_free
ORDER BY 
    ville_surface ASC
LIMIT 50

-- 3. Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”
SELECT
    ville_departement
FROM 
	villes_france_free
WHERE ville_departement LIKE '97%'

-- 4. Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
SELECT 
	ville_nom,
    ville_population_2012,
    departement_code,
	departement_nom
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
ORDER BY `ville_population_2012` DESC 
LIMIT 10

-- 5. Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
SELECT departement_nom, ville_departement, COUNT(*) AS nbr_items 
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY `nbr_items` DESC

-- 6. Obtenir la liste des 10 plus grands départements, en terme de superficie
SELECT 
	departement_nom,
	ville_departement,
	SUM(ville_surface) AS departementSurface
FROM `villes_france_free` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY departementSurface DESC
LIMIT 10

-- 7. Compter le nombre de villes dont le nom commence par “Saint”
SELECT 
	COUNT(ville_nom) AS nbr_ville
FROM `villes_france_free` 
WHERE ville_nom LIKE 'Saint%'

-- 8. Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
