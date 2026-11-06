# Yapay Zeka Kullanım Beyanı 
1. Veri Temini ve Araştırma Süreci (Öğrenci Çalışması)
Projede kullanılan lojistik ve tedarik zinciri veri seti, Kaggle platformu üzerinden tamamen şahsım (öğrenci) tarafından araştırılmış, incelenmiş ve seçilmiştir. Veri setinin indirilmesi, projenin dizin yapısına (data/raw/) konumlandırılması ve temel incelemeleri tamamen kendi bireysel çabamla gerçekleştirilmiştir.

2. Yapay Zeka Desteği Alınan Alanlar
Projenin veri temizleme, veritabanı entegrasyonu ve analitik aşamalarında şu konularda yapay zeka asistanından destek alınmıştır:
Veritabanı Entegrasyonu ve Kod Yazımı: PostgreSQL veritabanına CSV verilerinin aktarılması sırasında karşılaşılan format ve yol hatalarının (path/import hataları) giderilmesi için Python/Pandas tabanlı çözüm betiklerinin (im.py) oluşturulmasında rehberlik alınmıştır.
SQL Analitik Sorguları: Veri setindeki alanlar (traffic_congestion_level, shipping_costs, delay_probability vb.) üzerinden hocanın belirttiği kriterlere uygun olarak GROUP BY, AVG, ORDER BY ve CASE WHEN mantıklarını içeren 5 adet analitik SQL sorgusunun yazılması ve optimize edilmesinde ortak çalışma yürütülmüştür.
Dokümantasyon ve Senaryo Düzenlemesi: SCENARIO.md ve README.md dosyalarının proje kura senaryosuna (Kura #2) akademik formatta uygun olarak yapılandırılmasında metin düzenleme desteği alınmıştır.

3. Sonuç
Projenin temel fikri, veri kaynağının seçilmesi ve projenin GitHub deposunda organize edilmesi süreci tamamen öğrenci sorumluluğunda yürütülmüş; teknik uygulama, hata ayıklama ve sorgu geliştirme adımlarında ise yapay zekadan aktif bir koç ve iş birliği aracı olarak faydalanılmıştır.