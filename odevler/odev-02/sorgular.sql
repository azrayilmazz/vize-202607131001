-- Soru 1: Her robotun adı, operatör adı ve operatörün telefonu (INNER JOIN)
SELECT
    r.name,
    o.operator_name,
    o.phone
FROM robots AS r
INNER JOIN operators AS o
    ON r.operator_name = o.operator_name;
--9 satır döndü.Her satırda robotun adı,operatörlerin adı ve telefonu listelendi.
--Soru 2:-- Soru 1: Her robotun adı, operatör adı ve operatörün telefonu (INNER JOIN)
SELECT
    r.name,
    o.operator_name,
    o.phone
FROM robots AS r
INNER JOIN operators AS o
    ON r.operator_name = o.operator_name;
--9 satır döndü.Her satırda robotun adı,operatörlerin adı ve telefonu listelendi.
--Soru 2: