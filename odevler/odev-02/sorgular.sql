-- Soru 1: Her robotun adı, operatör adı ve operatörün telefonu (INNER JOIN)
SELECT
    r.name,
    o.operator_name,
    o.phone
FROM robots AS r
INNER JOIN operators AS o
    ON r.operator_name = o.operator_name;
--9 satır döndü.Her satırda robotun adı,operatörlerin adı ve telefonu listelendi.
--Soru 2: Operatörü olmayan robotları da kapsayacak şekilde tüm robotlar ve operatörleri (LEFT JOIN)
SELECT
    r.name,
    o.operator_name,
    o.phone
FROM robots AS r
LEFT JOIN operators AS o
    ON r.operator_name = o.operator_name;
--10 satır döndü.9.satırdaki Mars 03 robotunun operator_name ve phone alanları [null] geldiği için INNER JOIN sırasında kayboldu.(Çünkü bağlı bir operatör yoktu.)
--Soru 3:Hiç görev almamış robotların bilgileri (LEFT JOIN + IS NULL)
SELECT
    r.name,
    r.model
FROM robots AS r
LEFT JOIN missions AS m
    ON r.id = m.robot_id
WHERE m.robot_id IS NULL;
--4 satır döndü. Ve missions tablosundaki robot_id değerleri (1, 2, 3, 5, 6, 8) ile robots tablosundaki id değerleri (4, 7, 9, 10) eşleşmediği için 4 robot da NULL eşleşme olarak listelendi.
--Soru 4a: robots ve missions birleştirildikten sonra sum(battery_level)
SELECT
    SUM(r.battery_level) AS join_toplam_batarya
FROM robots AS r
INNER JOIN missions AS m
    ON r.id = m.robot_id;
--1 satır döndü (700). INNER JOIN eşleşen her görev satırında robotun bataryasını tekrarladığı için birden fazla görevi olan robotların batarya seviyelerini görev sayısı kadar üst üste toplandı.
--Soru 4b: JOIN kullanmadan görevi olan robotların toplam batarya seviyesi
SELECT
    SUM(r.battery_level) AS dogru_toplam_batarya
FROM robots AS r
WHERE r.id IN (
    SELECT DISTINCT m.robot_id
    FROM missions AS m
    WHERE m.robot_id IS NOT NULL
);
--1 satır döndü (262).JOIN kullanılmadığı için birden fazla görevi olan robotların bataryaları tekrarlanmadan yalnızca bir kez toplandı ve 700 yerine gerçek toplam hesaplandı.
--Soru 5: Robot başına görev sayısı (count(*) ve count(m.id) yan yana)
SELECT
    r.id,
    r.name,
    COUNT(*) AS count_yildiz,
    COUNT(m.id) AS count_m_id
FROM robots AS r
LEFT JOIN missions AS m
    ON r.id = m.robot_id
GROUP BY
    r.id,
    r.name
ORDER BY r.id;
--10 satır döndü.Görevi olmayan 4 robotta (id: 4, 7, 9, 10) LEFT JOIN'den gelen NULL eşleşme satırını COUNT(*) sayıp 1 döndürürken COUNT(m.id) NULL değerleri saymayıp 0 döndürdüğü için ikisi farklı çıktı.

