# SQL Amaliy Topshiriqlar To'plami
### DataWithBaraa kursi bo'yicha — Bank ma'lumotlar bazasi ustida

**Baza:** `01_bank_schema.sql` faylini ishga tushiring (SSMS yoki boshqa muhitda).

**Qiyinlik darajalari:**
- 🟢 asosiy — sintaksisni mustahkamlash
- 🟡 o'rta — bir nechta tushunchani birlashtirish
- 🔴 qiyin — real ish/suhbat darajasi

**Ishlash tartibi:**
1. Kursda mavzuni ko'ring
2. Shu bo'limdagi **nazorat savollariga** yozmasdan javob berishga urining
3. Topshiriqlarni yeching — **avval o'zingiz**, keyin tekshiring
4. Har bir topshiriq raqamlangan (T1–T152). Javob kerak bo'lsa: *"T47 javobini tushuntirib ber"*

**Muhim qoida:** har bir topshiriqni yechgach o'zingizga savol bering — *"buni boshqacha qanday yozish mumkin edi va qaysi biri tezroq ishlaydi?"*

---

## 1️⃣ SELECT asoslari — `34:01`

**Nazorat savollari:** SELECT bandlari qaysi tartibda *yoziladi* va qaysi tartibda *bajariladi*? `WHERE` va `HAVING` farqi nima?

| # | Topshiriq |
|---|---|
| T1 🟢 | Barcha mijozlarning ism, familiya, shahar va segmentini chiqaring. |
| T2 🟢 | Xodimlarni maoshi bo'yicha kamayish tartibida saralang, faqat ism-familiya va maosh ustunlari bilan. |
| T3 🟢 | Hisoblardagi noyob valyutalar ro'yxatini chiqaring (takrorlanmasin). |
| T4 🟢 | Mijozlarning to'liq ismini bitta ustunda `full_name` nomi bilan chiqaring. |
| T5 🟡 | Eng katta balansga ega 5 ta hisobni chiqaring (hisob raqami, tur, valyuta, balans). |
| T6 🟡 | Har bir hisob uchun balansning 5% dan iborat "yillik foiz" summasini hisoblab, `annual_interest` ustunida ko'rsating. |
| T7 🟡 | Tranzaksiyalarning noyob `txn_type` + `channel` juftliklarini chiqaring va alifbo tartibida saralang. |

> ⚠️ **Tuzoq:** `SELECT DISTINCT` bir nechta ustunga qo'llanganda har bir ustunga alohida emas, butun **qatorga** ta'sir qiladi. T7'da shuni tekshiring.

---

## 2️⃣ DDL — `1:32:31`

**Nazorat savollari:** `DROP` / `TRUNCATE` / `DELETE` farqi? `ALTER TABLE` qaysi holatda mavjud ma'lumotni buzadi?

| # | Topshiriq |
|---|---|
| T8 🟢 | `customer_complaints` jadvalini yarating: `complaint_id` (PK), `customer_id` (FK), `complaint_date`, `category`, `description`, `status`. |
| T9 🟢 | Shu jadvalga `priority` ustunini qo'shing (matn, standart qiymat `'Normal'`). |
| T10 🟡 | `status` ustuniga faqat `'Open'`, `'InProgress'`, `'Closed'` qiymatlariga ruxsat beruvchi CHECK cheklovini qo'shing. |
| T11 🟡 | `accounts` jadvalidagi `balance` ustuni manfiy bo'lmasligini ta'minlovchi cheklov qo'shing. Muvaffaqiyatli bo'ladimi? Nima uchun? |
| T12 🔴 | `customer_complaints` jadvalining FK cheklovini `ON DELETE CASCADE` bilan qayta yarating va bu qaror bank tizimida **xavfli** bo'lishi mumkinligini izohlang. |

---

## 3️⃣ DML — `1:43:44`

| # | Topshiriq |
|---|---|
| T13 🟢 | `customer_complaints` jadvaliga 3 ta yozuv qo'shing (turli mijozlar, turli sana). |
| T14 🟢 | Barcha `'Open'` shikoyatlarni `'InProgress'` holatiga o'tkazing. |
| T15 🟡 | 2024-yilda birorta ham tranzaksiya qilmagan hisoblarning statusini `'Dormant'` ga o'zgartiring. (Avval `SELECT` bilan qaysi qatorlar tegishini tekshiring!) |
| T16 🟡 | `'Retail'` segmentidagi va telefoni `NULL` bo'lgan mijozlar uchun shikoyat yozuvlarini `INSERT ... SELECT` orqali qo'shing. |
| T17 🔴 | `MERGE` (yoki `UPDATE`+`INSERT`) yordamida: agar mijozning kredit statusi `'Overdue'` bo'lsa segmentini `'Watchlist'` ga o'zgartiring, aks holda tegmang. |

> ⚠️ **Qoida:** `UPDATE`/`DELETE` yozishdan oldin **doim** o'sha `WHERE` bilan `SELECT` ni ishga tushiring. Bank bazasida bu odat sizni ishdan bo'shatilishdan saqlaydi.

---

## 4️⃣ Filtering — `2:08:03`

**Nazorat savollari:** `IN` va `EXISTS` orasida NULL bo'lganda nima farq bor? `BETWEEN` chegaralarni o'z ichiga oladimi?

| # | Topshiriq |
|---|---|
| T18 🟢 | Toshkent shahridagi `Premium` va `VIP` mijozlarni chiqaring. |
| T19 🟢 | Balansi 10 000 000 dan 100 000 000 gacha bo'lgan UZS hisoblarni toping. |
| T20 🟢 | Familiyasi `'ov'` yoki `'ova'` bilan tugaydigan mijozlarni chiqaring. |
| T21 🟡 | Email manzili yo'q, lekin telefoni bor mijozlarni toping. |
| T22 🟡 | 2024-yilning ikkinchi yarmida (iyul–dekabr) amalga oshgan, summasi 5 000 000 dan katta va `Completed` bo'lgan tranzaksiyalarni chiqaring. |
| T23 🟡 | Yopilmagan (`closed_date IS NULL`) lekin statusi `'Closed'` bo'lgan hisoblar bormi? Ma'lumot sifatini tekshiring. |
| T24 🟡 | Ismi yoki familiyasida `'a'` harfi kamida 3 marta uchraydigan mijozlarni toping. |
| T25 🔴 | `merchant_category` `NULL` bo'lmagan, lekin `channel` `POS` ham `Online` ham bo'lmagan tranzaksiyalarni toping (mantiqiy anomaliya qidiruvi). |
| T26 🔴 | Kartasi muddati 2024-yil ichida tugagan, lekin statusi hali `'Active'` bo'lgan kartalarni toping. |

> ⚠️ **Tuzoq:** `WHERE merchant_category <> 'Grocery'` — bu `NULL` qatorlarni **tashlab ketadi**. T25'da shu xatoga tushmang.

---

## 5️⃣ JOIN asoslari — `2:47:57`

| # | Topshiriq |
|---|---|
| T27 🟢 | Har bir hisob uchun egasining ism-familiyasini chiqaring. |
| T28 🟢 | Har bir tranzaksiya uchun hisob turi, valyuta va mijoz ismini chiqaring. |
| T29 🟢 | Har bir xodim va u ishlaydigan filial nomini chiqaring. |
| T30 🟡 | Hech qanday hisobi yo'q mijozlarni toping (LEFT JOIN orqali). |
| T31 🟡 | Birorta xodimi yo'q filiallarni toping. |
| T32 🟡 | Har bir kredit uchun: mijoz ismi, filial nomi va kredit ofitseri ismi. Ofitseri yo'q kreditlar ham ko'rinsin. |
| T33 🟡 | Hech qanday tranzaksiyasi bo'lmagan aktiv hisoblarni toping. |
| T34 🔴 | Har bir mijoz uchun: hisoblar soni, kartalar soni va kreditlar soni — bitta natijada. (Diqqat: to'g'ridan-to'g'ri JOIN qilsangiz sonlar **ko'payib ketadi** — nega?) |

> 🔴 **Eng muhim tushuncha:** T34 — "fan-out" muammosi. Bir nechta 1:N jadvalni birdaniga JOIN qilish COUNT'ni buzadi. Yechim: alohida agregatsiya + JOIN, yoki `COUNT(DISTINCT ...)`.

---

## 6️⃣ JOIN advanced — `3:27:29`

| # | Topshiriq |
|---|---|
| T35 🟡 | SELF JOIN: har bir xodim va uning rahbari ismini chiqaring. Rahbari yo'qlar ham ko'rinsin. |
| T36 🟡 | Bir xil filialda ishlaydigan, lekin turli lavozimdagi xodim juftliklarini chiqaring (takroriy juftliklarsiz). |
| T37 🟡 | CROSS JOIN: har bir filial × har bir valyuta kombinatsiyasini yarating (hisobot shabloni uchun). |
| T38 🔴 | Har bir USD hisob uchun uning ochilgan oyidagi kursni `exchange_rates` dan olib, balansni so'mga aylantiring. |
| T39 🔴 | Har bir tranzaksiya uchun o'sha oyning kursini topib, summani UZS ekvivalentiga o'tkazing (faqat valyutasi UZS bo'lmagan hisoblar uchun). |
| T40 🔴 | FULL OUTER JOIN yordamida: `customers` va `employees` ni familiya bo'yicha solishtiring — kim ikkalasida ham bor? |
| T41 🔴 | Har bir mijoz uchun eng oxirgi tranzaksiyasini chiqaring (hisoblar bo'ylab). Ikkita usulda yozing: `JOIN + subquery` va `APPLY`/lateral. |

---

## 7️⃣ Set Operators — `4:02:09`

**Nazorat savollari:** `UNION` va `UNION ALL` — qaysi biri tezroq va nega? `INTERSECT` NULL bilan qanday ishlaydi?

| # | Topshiriq |
|---|---|
| T42 🟢 | Toshkentdagi mijozlar va Toshkentdagi filiallarda ishlaydigan xodimlarning ismlarini bitta ro'yxatga birlashtiring (`type` ustuni bilan: 'Customer'/'Employee'). |
| T43 🟢 | `UNION` va `UNION ALL` ni bir xil so'rovda solishtiring va qatorlar sonidagi farqni tushuntiring. |
| T44 🟡 | `INTERSECT`: ham krediti, ham depozit hisobi bor mijozlarni toping. |
| T45 🟡 | `EXCEPT`: hisobi bor, lekin krediti yo'q mijozlarni toping. |
| T46 🔴 | Bir yillik hisobot: har bir chorak uchun jami tranzaksiya summasini 4 ta alohida `SELECT` orqali `UNION ALL` bilan birlashtiring, keyin xuddi shu natijani `GROUP BY` bilan qayta yozing va qaysi biri to'g'ri yondashuv ekanini izohlang. |

---

## 8️⃣ String Functions — `4:52:58`

| # | Topshiriq |
|---|---|
| T47 🟢 | Mijozlarning bosh harflarini chiqaring (masalan, `Akmal Toshmatov` → `A.T.`). |
| T48 🟢 | Barcha email manzillarini kichik harfga o'tkazing va domen qismini alohida ustunga ajrating. |
| T49 🟢 | Telefon raqamlaridan faqat oxirgi 4 ta raqamni chiqaring, qolganini `***` bilan maskalang. |
| T50 🟡 | Filial nomlaridagi bo'sh joylar sonini hisoblang. |
| T51 🟡 | Mijoz ismini `familiya, ism` formatida chiqaring va bo'sh joylarni tozalang (`TRIM`). |
| T52 🟡 | Email manzilining `@` gacha bo'lgan qismini foydalanuvchi nomi sifatida ajrating (`CHARINDEX`/`INSTR` + `SUBSTRING`). |
| T53 🔴 | Har bir mijoz uchun 8 belgili login yarating: familiyaning birinchi 5 harfi + `customer_id` (nol bilan to'ldirilgan, masalan `TOSHM001`). |
| T54 🔴 | `merchant_category` qiymatlarini bir xil formatga keltiring: birinchi harf katta, qolgani kichik — va `REPLACE` bilan `'Electronics'` → `'Tech'` ga almashtiring. |

---

## 9️⃣ Numeric Functions — `5:18:44`

| # | Topshiriq |
|---|---|
| T55 🟢 | Barcha hisob balanslarini million so'mga aylantirib, 2 xonagacha yaxlitlang. |
| T56 🟢 | Kredit foiz stavkalarini butun songa yaxlitlang (`ROUND`, `CEILING`, `FLOOR` — uchalasini solishtiring). |
| T57 🟡 | Har bir kredit uchun oylik to'lovni taxminan hisoblang: `principal / term_months` va natijani 1000 ga yaxlitlang. |
| T58 🟡 | Tranzaksiya summalarining kvadrat ildizi va logarifmini chiqaring (statistik tahlil uchun). |
| T59 🔴 | Har bir mijozning `customer_id` sini 3 ga bo'lgandagi qoldig'i bo'yicha guruhlab, "A/B/C test guruhi" tayinlang (`%` yoki `MOD`). |

---

## 🔟 Date & Time Functions — `5:22:48`

**Nazorat savollari:** `DATEDIFF` chegaralarni qanday sanaydi? Nima uchun `WHERE YEAR(txn_date) = 2024` indeksni buzadi?

| # | Topshiriq |
|---|---|
| T60 🟢 | Har bir mijozning yoshini hisoblang (bugungi kunga nisbatan). |
| T61 🟢 | Har bir xodimning bankda necha yil ishlaganini hisoblang. |
| T62 🟢 | Tranzaksiyalarni yil va oy bo'yicha ajrating (`2024-01` formatida). |
| T63 🟡 | Har bir tranzaksiya hafta kunini chiqaring va dam olish kunidagilarini belgilang. |
| T64 🟡 | Har bir kredit uchun tugash sanasini hisoblang (`issued_date` + `term_months`). |
| T65 🟡 | 2024-yil har bir oyning oxirgi kunini va o'sha oydagi tranzaksiyalar sonini chiqaring. |
| T66 🟡 | Kechikkan kredit to'lovlarini toping va necha kun kechikkanini hisoblang. |
| T67 🔴 | Har bir mijoz uchun ro'yxatdan o'tganidan birinchi tranzaksiyagacha necha kun o'tganini hisoblang. |
| T68 🔴 | Tranzaksiyalarni soat bo'yicha 4 ta oraliqqa bo'ling (00–06, 06–12, 12–18, 18–24) va har bir oraliqdagi hajmni chiqaring. |
| T69 🔴 | `WHERE YEAR(txn_date) = 2024` so'rovini **sargable** (indeksdan foydalana oladigan) shaklga qayta yozing. |

---

## 1️⃣1️⃣ NULL Functions — `6:59:06`

**Nazorat savollari:** `NULL = NULL` nimaga teng? `COUNT(*)` va `COUNT(column)` farqi? `AVG` NULL larni hisobga oladimi?

| # | Topshiriq |
|---|---|
| T70 🟢 | Aloqa ma'lumotini chiqaring: email bo'lsa email, bo'lmasa telefon, u ham bo'lmasa `'Aloqa yo''q'`. |
| T71 🟢 | To'lanmagan kredit to'lovlarida `paid_amount` ni 0 bilan almashtiring. |
| T72 🟡 | Har bir kredit uchun to'langan umumiy summani hisoblang — NULL lar natijani buzmasin. |
| T73 🟡 | `AVG(paid_amount)` va `SUM(paid_amount)/COUNT(*)` natijalarini solishtiring. Nega farq qiladi? |
| T74 🟡 | `NULLIF` yordamida nolga bo'linishdan himoyalangan hisob: har bir kredit uchun `to'langan / jami_qarz` nisbati. |
| T75 🟡 | Email va telefoni bir vaqtda NULL bo'lgan mijozlarni toping. |
| T76 🔴 | Har bir ustun bo'yicha NULL qiymatlar sonini bitta natijada chiqaradigan "data quality" so'rovi yozing (`customers` jadvali uchun). |
| T77 🔴 | Saralashda NULL lar doim oxirida turishini ta'minlang (`ORDER BY` + `CASE`). |

---

## 1️⃣2️⃣ CASE — `8:07:50`

| # | Topshiriq |
|---|---|
| T78 🟢 | Hisoblarni balans bo'yicha toifalang: `<1M` = 'Kichik', `1M–50M` = 'O'rta', `>50M` = 'Katta'. |
| T79 🟢 | Tranzaksiyalarni yo'nalish bo'yicha belgilang: Deposit = `+`, Withdrawal/Payment/Fee = `-`. |
| T80 🟡 | Yuqoridagi belgidan foydalanib har bir hisobning **sof oqimini** (kirim − chiqim) hisoblang. |
| T81 🟡 | Mijozlarni yosh guruhlariga ajrating (18–30, 31–45, 46–60, 60+) va har bir guruhdagi sonini chiqaring. |
| T82 🟡 | Kreditlar uchun risk darajasi: `Overdue` = 'Yuqori', foiz > 25 = 'O'rta', qolgani = 'Past'. |
| T83 🔴 | **Pivot (CASE bilan)**: har bir filial uchun ustunlarda `Retail`, `Premium`, `VIP`, `Corporate` mijozlar soni. |
| T84 🔴 | Har bir oy uchun `Deposit`, `Withdrawal`, `Payment`, `Transfer` summalarini alohida ustunlarda chiqaring (conditional aggregation). |
| T85 🔴 | Mijozlarni "sog'lomlik skori" bilan baholang: hisob soni, jami balans, kredit statusi va oxirgi faollikni birlashtirib 0–100 ball bering. |

---

## 1️⃣3️⃣ Aggregate Functions — `8:43:36`

| # | Topshiriq |
|---|---|
| T86 🟢 | Har bir valyuta bo'yicha jami balans va hisoblar soni. |
| T87 🟢 | Har bir filialdagi o'rtacha maosh, eng yuqori va eng past maosh. |
| T88 🟡 | Har bir segment bo'yicha mijozlar soni va o'rtacha yosh, faqat 3 tadan ko'p mijozi bor segmentlar. |
| T89 🟡 | Har bir kanal (`channel`) bo'yicha tranzaksiyalar soni va jami hajm, hajm bo'yicha saralangan. |
| T90 🟡 | Har bir mijoz uchun: hisoblar soni, jami balans, eng katta hisob balansi. |
| T91 🔴 | `GROUPING SETS` / `ROLLUP` yordamida: filial × valyuta bo'yicha jami balans + oraliq yig'indilar + umumiy yig'indi. |
| T92 🔴 | Har bir filial uchun bank bo'yicha umumiy balansdagi ulushini foizda hisoblang. |

---

## 1️⃣4️⃣ Window Functions — asoslar va agregat — `8:50:11` / `9:47:00`

**Nazorat savollari:** `GROUP BY` va `OVER()` farqi nima? `ROWS` va `RANGE` frame farqi? Default frame nima?

| # | Topshiriq |
|---|---|
| T93 🟢 | Har bir hisob uchun balansni va bank bo'yicha umumiy balansni bir qatorda chiqaring. |
| T94 🟢 | Har bir hisob balansini o'z filiali o'rtacha balansi bilan yonma-yon ko'rsating. |
| T95 🟡 | Har bir tranzaksiya uchun o'sha hisob bo'yicha **yig'ilib boruvchi balans** (running total) ni hisoblang. |
| T96 🟡 | Har bir tranzaksiya o'sha hisobning jami hajmidan necha foizini tashkil qilishini hisoblang. |
| T97 🟡 | Har bir mijoz uchun tranzaksiyalarining 3 talik **harakatlanuvchi o'rtachasini** (moving average) hisoblang. |
| T98 🔴 | Har bir hisob uchun oxirgi 3 tranzaksiya yig'indisini `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` bilan chiqaring. |
| T99 🔴 | `ROWS` va `RANGE` bilan bir xil so'rovni yozing va **bir xil sanadagi** tranzaksiyalarda natija qanday farq qilishini ko'rsating. |
| T100 🔴 | Har bir filial uchun oylik tranzaksiya hajmi va o'sha filialning yillik jami hajmiga nisbatan kumulyativ ulushi. |

---

## 1️⃣5️⃣ Window Ranking — `10:53:09`

**Nazorat savollari:** `ROW_NUMBER` / `RANK` / `DENSE_RANK` — teng qiymatlarda qanday farq qiladi?

| # | Topshiriq |
|---|---|
| T101 🟢 | Mijozlarni jami balansi bo'yicha reytinglang (3 ta funksiyani yonma-yon solishtiring). |
| T102 🟡 | Har bir filialdagi eng boy 3 ta mijozni toping. |
| T103 🟡 | Har bir hisob uchun eng katta summali tranzaksiyani toping. |
| T104 🟡 | Mijozlarni `NTILE(4)` bilan balans bo'yicha 4 ta kvartilga bo'ling. |
| T105 🟡 | Har bir mijozning oxirgi tranzaksiyasini `ROW_NUMBER` orqali toping. |
| T106 🔴 | Har bir filial × oy kesimida eng faol mijozni (tranzaksiya soni bo'yicha) aniqlang. |
| T107 🔴 | Balansi bank bo'yicha yuqori 10% ga kiradigan mijozlarni `PERCENT_RANK` yoki `NTILE(10)` bilan toping. |
| T108 🔴 | Takrorlangan yozuvlarni aniqlash: bir xil ism, familiya va tug'ilgan sanaga ega mijozlarni `ROW_NUMBER` bilan toping va faqat birinchisini qoldiruvchi `DELETE` yozing. |

---

## 1️⃣6️⃣ Window Value (LAG / LEAD / FIRST_VALUE) — `11:56:05`

| # | Topshiriq |
|---|---|
| T109 🟢 | Har bir tranzaksiya uchun o'sha hisobdagi **oldingi** tranzaksiya summasini ko'rsating. |
| T110 🟢 | Har bir tranzaksiya uchun keyingi tranzaksiya sanasini ko'rsating. |
| T111 🟡 | Ketma-ket tranzaksiyalar orasidagi kunlar farqini hisoblang. |
| T112 🟡 | Har bir hisobning birinchi va oxirgi tranzaksiya summasini har bir qatorda ko'rsating (`FIRST_VALUE` / `LAST_VALUE`). |
| T113 🟡 | Oylik tranzaksiya hajmining oldingi oyga nisbatan o'sish foizini hisoblang (MoM growth). |
| T114 🔴 | `LAST_VALUE` ni frame ko'rsatmasdan ishlating, keyin `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` bilan ishlating — nega natija farq qiladi? |
| T115 🔴 | Har bir mijoz uchun **eng uzun faolliksiz davrni** (ikki tranzaksiya orasidagi maksimal tanaffus) toping. |
| T116 🔴 | **Gaps & Islands:** hisob 1001 uchun tranzaksiya bo'lmagan oylarni aniqlang va ketma-ket bo'sh oylarni bitta "oraliq" sifatida guruhlang. |

---

## 1️⃣7️⃣ Subqueries — `12:58:04`

**Nazorat savollari:** Correlated va non-correlated subquery farqi? Qaysi biri har bir qator uchun qayta bajariladi?

| # | Topshiriq |
|---|---|
| T117 🟢 | Balansi o'rtacha balansdan yuqori bo'lgan hisoblarni toping. |
| T118 🟢 | Eng yuqori maosh oluvchi xodimni scalar subquery bilan toping. |
| T119 🟡 | Har bir mijoz uchun uning hisoblari sonini correlated subquery orqali chiqaring. |
| T120 🟡 | `EXISTS` yordamida: 2024-yilda kamida bitta tranzaksiya qilgan mijozlarni toping. |
| T121 🟡 | `NOT EXISTS` yordamida: hech qachon kredit olmagan mijozlarni toping. |
| T122 🟡 | Har bir filialda o'sha filial o'rtachasidan yuqori maosh oluvchi xodimlarni toping. |
| T123 🔴 | `NOT IN` va `NOT EXISTS` ni bir xil masalada yozing va subquery natijasida `NULL` bo'lganda `NOT IN` nima uchun **bo'sh natija** qaytarishini ko'rsating. |
| T124 🔴 | Derived table (`FROM (SELECT ...)`) orqali: har bir segment uchun eng yuqori balansli mijozni toping. |
| T125 🔴 | Har bir mijoz uchun oxirgi kredit to'lovi ma'lumotini correlated subquery bilan chiqaring va xuddi shu natijani `OUTER APPLY` bilan qayta yozing — ikkalasining execution plan'ini solishtiring. |

---

## 1️⃣8️⃣ CTE — `14:18:08`

| # | Topshiriq |
|---|---|
| T126 🟢 | CTE yordamida har bir mijozning jami balansini hisoblab, keyin 50M dan yuqorilarini filtrlang. |
| T127 🟡 | Ikkita CTE: biri oylik tranzaksiya hajmi, ikkinchisi oylik o'rtacha — ikkalasini birlashtirib solishtiring. |
| T128 🟡 | CTE zanjiri (3 bosqich): xom tranzaksiyalar → oylik agregatsiya → o'sish foizi. |
| T129 🔴 | **Rekursiv CTE:** xodimlar iyerarxiyasini chiqaring (direktordan boshlab, har bir darajani `level` ustuni bilan). |
| T130 🔴 | **Rekursiv CTE:** 2024-yilning barcha oylarini generatsiya qiling va tranzaksiyalar bilan LEFT JOIN qilib, bo'sh oylarni 0 bilan to'ldiring. |
| T131 🔴 | Har bir xodim uchun uning qo'l ostidagi **barcha** (bevosita va bilvosita) xodimlar sonini rekursiv CTE bilan hisoblang. |
| T132 🔴 | Bir xil masalani subquery, CTE va temp table bilan yozing — o'qilishi va tezligini solishtiring. |

---

## 1️⃣9️⃣ Views — `15:35:02`

| # | Topshiriq |
|---|---|
| T133 🟢 | `vw_active_accounts` view yarating: faqat aktiv hisoblar, mijoz ismi va filial nomi bilan. |
| T134 🟡 | `vw_customer_360` yarating: mijoz, hisoblar soni, jami balans, kreditlar soni, oxirgi tranzaksiya sanasi. |
| T135 🟡 | `vw_monthly_report` yarating: filial × oy bo'yicha tranzaksiya soni va hajmi. |
| T136 🔴 | View orqali `UPDATE` qilishga urinib ko'ring — qaysi holatda ishlaydi, qaysi holatda yo'q? `WITH CHECK OPTION` nima qiladi? |
| T137 🔴 | Xavfsizlik view'i: tellerlar uchun mijoz telefon/emailini maskalangan holda ko'rsatuvchi view yarating. |

---

## 2️⃣0️⃣ CTAS va Temp Tables — `16:36:40`

| # | Topshiriq |
|---|---|
| T138 🟢 | `SELECT INTO` bilan `customer_summary` jadvalini yarating (mijoz + jami balans). |
| T139 🟡 | Vaqtinchalik jadval (`#temp`) yarating, unga oylik agregatsiyani yozing va keyin undan hisobot oling. |
| T140 🟡 | Table variable (`@table`) va temp table farqini amalda ko'rsating (statistika, indeks). |
| T141 🔴 | Katta hisobotni 3 bosqichga bo'lib temp jadvallar orqali yozing va xuddi shu natijani bitta CTE zanjiri bilan yozing — bajarilish vaqtini solishtiring. |

---

## 2️⃣1️⃣ Stored Procedures — `17:27:04`

| # | Topshiriq |
|---|---|
| T142 🟢 | `sp_get_customer_accounts` protsedurasi: `@customer_id` ni qabul qilib, uning hisoblarini qaytaradi. |
| T143 🟡 | `sp_transfer_money`: `@from_account`, `@to_account`, `@amount` — balansni tekshirib, ikkala hisobni yangilaydi va tranzaksiya yozuvi qo'shadi. **Tranzaksiya (BEGIN TRAN / COMMIT / ROLLBACK) ishlatilsin.** |
| T144 🟡 | `sp_monthly_report`: `@year`, `@month` bo'yicha filial hisobotini qaytaradi, parametr NULL bo'lsa joriy oyni oladi. |
| T145 🔴 | `sp_transfer_money` ga `TRY...CATCH` va xato loglash qo'shing: xato bo'lsa ROLLBACK va `error_log` jadvaliga yozuv. |
| T146 🔴 | Chiqish parametri (`OUTPUT`) bilan protsedura: mijozning umumiy risk balini hisoblab qaytaradi. |

---

## 2️⃣2️⃣ Triggers — `18:12:58`

| # | Topshiriq |
|---|---|
| T147 🟡 | `accounts` jadvalidagi balans o'zgarishini `balance_audit` jadvaliga yozuvchi AFTER UPDATE trigger yarating (eski qiymat, yangi qiymat, sana, foydalanuvchi). |
| T148 🟡 | Yangi tranzaksiya qo'shilganda hisob balansini avtomatik yangilovchi trigger yozing. |
| T149 🔴 | Balansni manfiy qiymatga tushiruvchi `UPDATE` ni bloklovchi trigger (`ROLLBACK` + xato xabari). |
| T150 🔴 | Trigger'lar **nega** bank tizimlarida ehtiyotkorlik bilan ishlatilishini yozib izohlang: yashirin mantiq, debug qiyinligi, `INSERT` bo'yicha qatorlar to'plami (`inserted` bir nechta qator bo'lishi mumkin) muammosi. T148 ni ko'p qatorli INSERT'da sinab ko'ring — to'g'ri ishlaydimi? |

---

## 2️⃣3️⃣ Indexes, Execution Plan, Partitions, Performance — `18:23:42` → `22:24:25`

**Nazorat savollari:** Clustered va non-clustered indeks farqi? Covering index nima? Index seek va index scan farqi?

| # | Topshiriq |
|---|---|
| T151 🟡 | `transactions(account_id, txn_date)` bo'yicha indeks yarating va indeksdan oldin/keyin execution plan'ni solishtiring. |
| T152 🟡 | `customers(city)` bo'yicha indeks yarating, `INCLUDE` bilan covering index qiling va farqni ko'ring. |
| T153 🟡 | Quyidagi so'rovlarni execution plan'da tekshiring va nima uchun **index scan** bo'layotganini toping:<br>`WHERE YEAR(txn_date) = 2024`<br>`WHERE UPPER(city) = 'TOSHKENT'`<br>`WHERE amount + 0 > 1000000` |
| T154 🔴 | Yuqoridagi 3 so'rovni sargable shaklga qayta yozing va plan o'zgarganini isbotlang. |
| T155 🔴 | `SELECT *` va faqat kerakli ustunlarni tanlash orasidagi I/O farqini `SET STATISTICS IO ON` bilan o'lchang. |
| T156 🔴 | `transactions` jadvalini `txn_date` bo'yicha yillik partitsiyalarga bo'ling (partition function + scheme) va partition elimination ishlayotganini planda ko'rsating. |
| T157 🔴 | Sekin so'rovni optimallashtirish mashqi: T34 (fan-out) so'rovini 3 xil usulda yozing, uchalasining plan va vaqtini jadval qilib solishtiring. |

---

## 🏁 Yakuniy loyihalar (Capstone)

Bu 3 ta topshiriq — real bank hisobotchisi ishi. Har biri 1–3 soatlik.

### C1 — Mijoz 360° hisoboti
Bitta so'rovda (CTE zanjiri bilan) har bir mijoz uchun:
ism, segment, filial, hisoblar soni, jami balans (UZS ekvivalentida), aktiv kartalar soni, kreditlar soni, jami kredit qoldig'i, kechikkan to'lovlar soni, oxirgi tranzaksiya sanasi, oxirgi 90 kunda faolmi (Ha/Yo'q), risk toifasi.

### C2 — Oylik boshqaruv paneli
Filial × oy kesimida: tranzaksiyalar soni va hajmi, oldingi oyga nisbatan o'sish %, yil boshidan kumulyativ hajm, filialning umumiy hajmdagi ulushi %, eng faol kanal, eng ko'p ishlatilgan `merchant_category`. Natijani view qilib saqlang.

### C3 — Kredit portfeli sifati
Har bir kredit uchun: mijoz, tur, summa, foiz, kutilgan to'lovlar soni, haqiqiy to'langan summa, to'lov intizomi foizi, o'rtacha kechikish kunlari, DPD toifasi (0 / 1–30 / 31–90 / 90+), va filial bo'yicha jamlangan portfel sifati ko'rsatkichi. Stored procedure ko'rinishida yozing (`@as_of_date` parametri bilan).

---

## 📌 Ish tartibi bo'yicha tavsiya

| Kun | Rejа |
|---|---|
| 1 | Bazani o'rnatish + 1–3 bo'lim (T1–T17) |
| 2–3 | Filtering + Joins (T18–T41) — **eng muhim poydevor** |
| 4 | Set operators + String/Numeric (T42–T59) |
| 5–6 | Date/Time + NULL + CASE (T60–T85) |
| 7 | Aggregates (T86–T92) |
| 8–10 | **Window Functions (T93–T116)** — sekinlashtiring, bu joy hal qiluvchi |
| 11–12 | Subqueries + CTE (T117–T132) |
| 13 | Views + CTAS (T133–T141) |
| 14–15 | Procedures + Triggers (T142–T150) |
| 16–18 | Indexes + Plan + Performance (T151–T157) |
| 19–21 | Capstone C1, C2, C3 |

**Har bir topshiriqdan keyin:** yechimingizni yozib qo'ying (`.sql` faylda). 3 hafta ichida sizda o'z portfoliongiz bo'ladi — bu suhbatda ko'rsatish uchun juda kuchli material.
