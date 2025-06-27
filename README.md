# 🔷 ITSM Power BI Vorlage 1.0.0 🔷

Diese Power BI Vorlage dient als Grundlage für IT-Service-Management-Berichte (ITSM)  
nach Best Practices der ITIL 4-Philosophie. Sie enthält modellierte Tabellen, strukturierte Measures und ein standardisiertes Zeitmodell zur effizienten Berichtserstellung.

---

##  Zielsetzung

✔️ Bereitstellung eines **wiederverwendbaren, standardisierten Datenmodells**  
✔️ Optimierung der **ITSM-Analysefähigkeit** durch konsistente DAX-Strukturen  
✔️ Ermöglichung **geräteübergreifender Auswertungen** und Zeitvergleiche  
✔️ **Transparente Dokumentation** nach ITIL 4-Prinzipien

---

##  Enthaltene Elemente

###  Modellierte Tabellen

| Tabelle          | Beschreibung |
|------------------|--------------|
| `dim_Kalender`   | Zeitdimension mit Jahr, Quartal, Monat, Wochentag usw. |
| `dim_Geraet`     | Zusammenführung von `ipad` und `iphone` zur Geräteanalyse |
| `MeasureTable`   | Zentrale DAX-Measure-Tabelle zur logischen Trennung von Logik & Daten |

---

## 📐 Technische Highlights

- `dim_Kalender`: Unterstützt YTD, MTD, QTD, Zeitvergleiche  
- `dim_Geraet`: Einheitliche Gerätestruktur für iOS-Endgeräte  
- `MeasureTable`: Nur für DAX Measures – keine Datenbindung  
- ⚙️ Erstellt mit **CALENDAR**, **UNION**, **DISTINCT**, **SELECTCOLUMNS**

---

##  ITIL 4 Prinzipien (angewendet im Code)

| Prinzip                      | Umsetzung im Projekt |
|-----------------------------|-----------------------|
|  Fokussiere dich auf den Wert | Zentrale Strukturierung & Wiederverwendbarkeit |
|  Arbeite iterativ mit Feedback | Erweiterbare Measures und Tabellen |
|  Optimiere und automatisiere | Automatisierte Zeiterstellung per DAX |
|  Fördere Transparenz        | Kommentierte DAX-Logik mit Autor- und Zweckangabe |
|  Denk und arbeite ganzheitlich | Verknüpfung aller Gerätetypen und Zeitlogik |

---

##  Anwendungsbeispiele

- **Gerätereports** nach CI-Typ, Bezeichnung oder Lieferdatum  
- **Zeitbasierte Analysen** mit Unterstützung für:
  - Monats-, Quartals-, Jahresvergleiche
  - Drilldowns auf Wochentage oder Kalendertage
- **Filterung & Slicer** für:
  - Gerätetypen (iPad/iPhone)
  - Zeiträume
  - IT-Service-Zustände (optional erweiterbar)

---

##  Projektstruktur

```plaintext
ITSM_Power_BI_Vorlage_1.0.0/
├── Datenmodell.ms         # Tabellen- und Modellierungslogik
├── MeasureTable.ms        # Enthält zentrale DAX-Maßzahlen
├── Spalte.ms              # Zusätzliche berechnete Spalten (falls vorhanden)
└── README.md              # Projektbeschreibung (dieses Dokument)
```

---

## 📫 Kontakt

Fragen oder Feedback?  
**Doniman F. Peña Parra**

- 🌐 [GPT-Link zur Projektunterstützung](https://chatgpt.com/g/g-68150f83fda081919d979c8418039ee5-dashboard-design)  
- 🔗 [LinkedIn](https://www.linkedin.com/in/doniman-francisco-pe%C3%B1a-parra-609263232/)  
- ✉️ [dofp79@hotmail.com](mailto:dofp79@hotmail.com)

---

