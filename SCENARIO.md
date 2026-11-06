Senaryo Adı: Lojistik Operasyonları ve Müşteri Destek RAG Asistanı
1. Hikaye ve Bağlam
Bir kargo ve tedarik zinciri şirketinin müşteri hizmetleri, müşterilerden gelen "Where is my package?", "İade nasıl yapılır?" veya "Teslimatım neden gecikti?" gibi soruları bir RAG (Retrieval-Augmented Generation) asistanına yönlendirmektedir. Asistan, şirketin yardım dokümanlarından ilgili parçaları getirip bir dil modeli (LLM) aracılığıyla yanıt üretir. Şirket, hem operasyonel lojistik performansını (yakıt, trafik, gecikmeler) takip etmek hem de her yanıtın maliyetini ve hangi dokümandan beslendiğini izlemek istemektedir.

2. Ana Soru
"Hangi lojistik rotaları veya soru türleri en yüksek maliyeti/gecikmeyi üretiyor ve bu durum verimlilikle nasıl ilişkilidir?"

3. Hedef Kullanıcı ve Roller
Operasyon Yöneticisi: Lojistik maliyetlerini, trafik yoğunluğunu ve gecikme olasılıklarını analiz eder.
Müşteri Hizmetleri / Destek Ekibi: RAG asistanı üzerinden gelen talepleri ve LLM maliyet/token metriklerini izler.

4. Tablo Adayları ve Sütunlar
logistics_data (Lojistik ve Sevkiyat Tablosu):
timestamp (Zaman damgası)
fuel_consumption_rate (Yakıt tüketim oranı)   
6359a1c6-e176-4b70-bbc5-4ca421bed486
eta_variation_hours (Tahmini varış süresi sapması)   
6359a1c6-e176-4b70-bbc5-4ca421bed486
traffic_congestion_level (Trafik yoğunluk seviyesi)   
6359a1c6-e176-4b70-bbc5-4ca421bed486
shipping_costs (Nakliye maliyeti)   
6359a1c6-e176-4b70-bbc5-4ca421bed486
delay_probability (Gecikme olasılığı)   
6359a1c6-e176-4b70-bbc5-4ca421bed486
risk_classification (Risk sınıflandırması)   
6359a1c6-e176-4b70-bbc5-4ca421bed486

5. Yapay Zeka (YZ) Bileşeni
Dönem Sonu Hedefi: RAG tabanlı bilgi asistanının ürettiği yanıtların maliyet/token takibi, güven skoru ile olay arasındaki ilişkinin veritabanında izlenmesi ve anomali tespiti.

6. Veri Kaynağı Adayları
Tablo Verisi: Kaggle (Dynamic Supply Chain and Logistics Dataset) üzerinden temin edilmiştir
