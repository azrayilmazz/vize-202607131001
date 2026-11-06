#1 Trafik Yoğunluğu Seviyelerine Göre Ortalama Yakıt Tüketimi ve Gecikme Analizi
SELECT traffic_congestion_level, 
       ROUND(AVG(fuel_consumption_rate)::numeric, 2) AS ortalama_yakit_tuketimi, 
       ROUND(AVG(eta_variation_hours)::numeric, 2) AS ortalama_eta_sapmasi,
       COUNT(*) AS toplam_sefer_sayisi
FROM logistics_data
GROUP BY traffic_congestion_level
ORDER BY traffic_congestion_level DESC;
#2 Risk Sınıflandırmasına Göre Ortalama Nakliye Maliyetleri ve Gecikme Olasılığı
SELECT risk_classification,
       COUNT(*) AS kayit_sayisi,
       ROUND(AVG(shipping_costs)::numeric, 2) AS ortalama_nakliye_maliyeti,
       ROUND(AVG(delay_probability)::numeric, 2) AS ortalama_gecikme_olasiligi
FROM logistics_data
GROUP BY risk_classification
ORDER BY ortalama_nakliye_maliyeti DESC;
#3 Gümrükleme Süresi Uzun Olan ve Tedarikçi Güvenilirliği Düşük Kritik Seviyeler
SELECT timestamp, 
       customs_clearance_time, 
       supplier_reliability_score, 
       shipping_costs, 
       risk_classification
FROM logistics_data
WHERE customs_clearance_time > 5 AND supplier_reliability_score < 0.5
ORDER BY customs_clearance_time DESC
LIMIT 10;
#4 Hava Durumu Şiddetine Göre Ortalama Yükleme/Boşaltma Süreleri
SELECT weather_condition_severity,
       COUNT(*) AS sefer_sayisi,
       ROUND(AVG(loading_unloading_time)::numeric, 2) AS ortalama_yukleme_bosaltma_suresi,
       ROUND(AVG(lead_time_days)::numeric, 2) AS ortalama_teslim_suresi_gun
FROM logistics_data
GROUP BY weather_condition_severity
ORDER BY weather_condition_severity ASC;
#5 Risk Durumuna Göre Akıllı Kategorizasyon ve Maliyet Özeti (CASE WHEN)
SELECT 
       CASE 
           WHEN delay_probability > 0.7 THEN 'Yüksek Gecikme Riski'
           WHEN delay_probability BETWEEN 0.4 AND 0.7 THEN 'Orta Gecikme Riski'
           ELSE 'Düşük Gecikme Riski'
       END AS gecikme_kategorisi,
       COUNT(*) AS toplam_sefer,
       ROUND(AVG(shipping_costs)::numeric, 2) AS ortalama_maliyet,
       ROUND(AVG(driver_behavior_score)::numeric, 2) AS ortalama_surucu_puani
FROM logistics_data
GROUP BY gecikme_kategorisi
ORDER BY toplam_sefer DESC;
