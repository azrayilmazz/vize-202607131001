Veri Kartı (Data README)
Kaynak: Kaggle (Dynamic Supply Chain & Logistics Dataset / Public Domain - CC0)=yüklediğim veriler arasından kullandığım veri sadece budur. dynamic_supply_chain_logistics_dataset kopyası.csv olarak geçen veridir.  

Lisans: CC0: Public Domain   
İndirme Tarihi: 6 Kasım 2026   

Satır / Sütun Sayısı: 32,065 satır, 26 sütun   
Veri Türü Dağılımı: 24 adet sayısal sütun, 1 adet tarih/zaman sütun (timestamp), 1 adet metinsel kategorik sütun (risk_classification).
Gerçek Veri Oranı: Veri setinin %100'ü gerçek kaynaklı açık veri setinden alınmıştır; eksik veya sentetik veri üretilmemiştir.

Temizleme Adımları
Ham CSV dosyasındaki sütun adları PostgreSQL uyumlu hale getirilmiştir.
Tarih formatları timestamp without time zone tipine uygun olarak düzenlenmiştir.
Eksik veya tutarsız değer kontrolü yapılmış olup veri setinde boş (NULL) kritik alan tespit edilmemiştir.

Üretilen Tablolar ve Sütunlar
Tablo Adı: logistics_data
Önemli Sütunlar: timestamp, vehicle_gps_latitude, vehicle_gps_longitude, fuel_consumption_rate, eta_variation_hours, traffic_congestion_level, shipping_costs, delay_probability, risk_classification.