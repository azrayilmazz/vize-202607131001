# Ödev Raporu

> **Bu rapor yazdırılıp derste elden teslim edilir.** Aynı dosya reponda `odevler/odev-NN/rapor.md` olarak da durur.
> Bir sayfa yeterli, en fazla iki. Bilgisayarda doldurup yazdırabilirsin, elle de doldurabilirsin.

---

**Ödev no:** 02   **Hafta:** 07     **Tarih:** 26 / 11 / 2026

**Ad Soyad:** Elif Azra Yılmaz  **Öğrenci No:** 202607131001

**Program:** Yapay Zeka Operatörlüğü

**Kullandığım veritabanı:** `robot_fleet`

**PR bağlantısı:** https://github.com/azrayilmazz/vize-202607131001/pull/5

**Commit sayısı:** 5

---

## 1. Ne yaptım

Bu ödevde neyi çözdüğünü 3-5 cümleyle anlat. Soru listesini tekrar yazma; **ne öğrendiğini** yaz.

Bu ödevde `robot_fleet` veritabanındaki `robots`, `operators` ve `missions` tabloları üzerinde ilişkisel sorgular kurarak `INNER JOIN` ve `LEFT JOIN` farklarını  öğrendim. Eşleşmeyen kayıtların (`NULL` değerlerin) sorgu sonuçlarını, satır sayılarını ve `COUNT(*)` ile `COUNT(sütun)`  davranışlarını nasıl etkilediğini inceledim. Ayrıca çoklu eşleşmelerin `SUM()` gibi toplama fonksiyonlarında satır çoğalması nedeniyle hatalı yüksek sonuçlar üretebildiğini ve alt sorgu (`IN`) kullanarak doğru tekil toplamın nasıl hesaplanacağını kavradım

---

## 2. Sonuçlar

Çözdüğüm soru sayısı:  5 / 5    Bonus: denemedim

En zorlandığım soru: **Soru 4**

Neden zorlandım:

`robots` ve `missions` tablolarını `INNER JOIN` ile birleştirip `SUM(r.battery_level)` aldığımda 700 gibi beklenmedik derecede yüksek bir toplam çıktı; birden fazla görevi olan robotların batarya seviyelerinin görev sayısı kadar üst üste toplandığını ilk aşamada fark etmekte zorlandım.Hatta yanlış yaptığımı düşündüm.


Nasıl çözdüm:

Birleştirme (`JOIN`) kullanmadan `WHERE r.id IN (SELECT DISTINCT m.robot_id FROM missions AS m WHERE m.robot_id IS NOT NULL)` alt sorgusuyla görevi olan robotları tekil olarak filtreledim ve batarya seviyelerini yalnızca bir kez toplayarak gerçek sonuç olan 262 değerine ulaştım.

---

## 3. Beklemediğim bir sonuç

Bir sorgu beklediğinden farklı sayıda satır döndürdü mü? Hangisi ve neden?

(Eksik veri, koşul önceliği, büyük/küçük harf, birim dönüşümü… Böyle bir durumla karşılaşmadıysan "karşılaşmadım" yaz, ama önce iyi bak.)

**Soru no:** 3 ve 5

**Beklediğim:** 0 veya 1 satır   **Gelen:** 4 satır(soru 3) / 10 satır(soru 5)

**Sebebi:**

Başlangıçta sadece 4 robot kaydına baktığım için görevlerin bu robotlara ait olduğunu düşünmüştüm; ancak `missions` tablosunda 1, 2, 3, 5, 6, 8 numaralı robotların görevleri bulunurken `id`'si 4, 7, 9 ve 10 olan 4 robotun hiç görevi olmadığı ortaya çıktı. Bu nedenle Soru 3'te bu 4 robot listelendi, Soru 5'te ise bu 4 robotta `LEFT JOIN` kaynaklı `NULL` satırını `COUNT(*)` sayıp `1` döndürürken `COUNT(m.id)` `0` döndürdü.


---

## 4. Aldığım bir hata ve çözümü

Dönem boyunca hata mesajı okumayı öğreniyoruz. Bu hafta aldığın bir hatayı yaz.

**Hata mesajı:**

ERROR: column m.robot_id does not exist` (veya ilk denemede yabancı anahtar sütun adını yanlış tahmin etmekten kaynaklanan sütun bulunamadı hatası verdi.)

**Sebebi ve çözümü:**

missions` tablosundaki yabancı anahtar sütununun adını kontrol etmeden sorgu çalıştırdığım için hata aldım. pgAdmin Object Explorer üzerinden `missions > Columns` altındaki sütun adlarını (`robot_id`) ve `\d missions` yapısını inceleyerek birleştirme koşulunu `ON r.id = m.robot_id` olarak düzelttim.

---

## 5. Yapay zeka kullanım beyanı

 Kullandım, aşağıda belirttim:

| Soru no | Araç | Ne sordum (özet) | Cevabı nasıl doğruladım |> "Nasıl doğruladım" sütunu en önemlisi. "Çalıştırdım, 4 satır döndü, tabloyla karşılaştırdım" gibi somut bir şey yaz.

1-3 | Gemini | `INNER JOIN`, `LEFT JOIN` ve `IS NULL` mantığı ile tablo eşleşme kontrolü | pgAdmin'de sorguları çalıştırdım; dönen 9, 10 ve 4 satırı `robots` ve `missions` tablolarıyla tek tek karşılaştırdım |

 4 | Gemini | `JOIN` sonrası `SUM` şişmesinin nedeni ve `JOIN` olmadan alt sorgu ile çözümü | İki sorguyu da çalıştırdım; 700 ve 262 sonuçlarını görevli robotların bataryalarını elle toplayarak doğruladım. |

 5 | Gemini | `COUNT(*)` ve `COUNT(m.id)` arasındaki farkın `LEFT JOIN` ile ilişkisi | Sorguyu çalıştırıp 10 satırı inceledim; görevi olmayan 4 robotta (id: 4, 7, 9, 10) `1` ve `0` farkını teyit ettim. |

---

## 6. Öz değerlendirme

Rubriğe ([RUBRIK.md](../RUBRIK.md)) göre kendine bir seviye ver. Bu puanını etkilemez.

| Ölçüt | 4 Tam | 3 İyi | 2 Gelişmeli | 1 Yetersiz |
|---|---|---|---|---|
| A, Doğruluk | ☐ | ☑ | ☐ | ☐ |
| B, SQL kalitesi | ☐ | ☑ | ☐ | ☐ |
| C, Yorum ve analiz | ☐ | ☐ | ☑ | ☐ |
| D, Git ve PR disiplini | ☐ | ☑ | ☐ | ☐ |
| E, Dürüstlük ve beyan | ☐ | ☑ | ☐ | ☐ |

Bir dahaki ödevde daha iyi yapacağım şey:

Sorgu yazmaya başlamadan önce tüm tabloların sütun adlarını, veri tiplerini ve örnek kayıtlarını baştan sona inceleyerek tablo ilişkilerini kâğıt üzerinde netleştirmek ve yorumlamayı daha iyi yapabilmek.

---

## 7. Bana sorun

Anlamadığın, merak ettiğin ya da derste tekrar görmek istediğin bir konu:

INNER JOIN, LEFT JOIN ile alt sorgu (IN/DISTINCT) yaklaşımlarının ve COUNT(*) ile COUNT(sütun) fonksiyonlarının temel farklarını, hangi senaryolarda hangisini tercih etmemiz gerektiğini ve NULL değerlerin veya çoklu eşleşmelerin sonuçları nasıl etkilediğini derste örneklerle özetleyebilirseniz çok iyi olur hocam.

---

**İmza:** Elif Azra Yılmaz

---

*Doğruluk beyanı: Bu çalışmayı kendim yaptım. Kullandığım tüm yardımcı kaynakları ve yapay zeka araçlarını yukarıda beyan ettim.*
