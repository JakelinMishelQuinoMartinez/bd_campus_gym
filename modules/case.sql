USE campuslands_gym;

-- =================================================== CASE EN CONSULTA
-- Clasificar socios por rango de edad (asumimos edad basada en ID)
SELECT 
    nombres,
    apellidos,
    id,
    CASE 
        WHEN id BETWEEN 1 AND 3 THEN 'Joven (18-25)'
        WHEN id BETWEEN 4 AND 6 THEN 'Adulto (26-40)'
        WHEN id BETWEEN 7 AND 9 THEN 'Adulto mayor (41+)'
        ELSE 'Edad no determinada'
    END AS rango_edad
FROM socios;