//
// Dokumentation
// Measure:    M_Umsatz_YTD
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Tabelle:    Measure_KPI
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   04.06.2025
// Zweck:      Berechnung des kumulierten Umsatzes im laufenden Jahr (YTD)
// Beschreibung:
//   - Nutzt DATESYTD zur Zeitintelligenz mit einer Kalenderdimension
//   - Visualisierbar in Matrixen oder KPI-Tiles
//   - Unterstützt zeitbasiertes Monitoring im Service Reporting
// Prinzipien:
//   - Fokussiere dich auf den Wert (Monats-/Jahresvergleiche)
//   - Halte es einfach und praktisch (verwendbar über Kalenderdimension)
//

M_Umsatz_YTD = 
CALCULATE(
    [M_Umsatz],
    DATESYTD('dim_Kalender'[Datum])
)

//
// Dokumentation
// Maßzahl:    Gesamtdauer TRUE Vorgänge
// Tabelle:    MeasureTable
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   05.06.2025
// Zweck:      Berechnet die Gesamtdauer aller Downtimes mit Service Impact TRUE
// Beschreibung:
//   - Nutzt CALCULATE zur Filterung auf TRUE()
//   - Aggregiert [Dauer]-Werte
//

Gesamtdauer TRUE Vorgänge =
CALCULATE(
    SUM(fact_UngeplanteDowntimes[Dauer]),
    fact_UngeplanteDowntimes[Service Impact] = TRUE()
)


//
// Dokumentation
// Measure:    Anzahl Vorgänge
// Tabelle:    MeasureTable
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   05.06.2025
// Zweck:      Zählt alle Einträge in der Tabelle fact_UngeplanteDowntimes
// Beschreibung:
//   - Nutzt COUNTROWS auf der Faktentabelle fact_UngeplanteDowntimes
//   - Dient als Basiskennzahl für Dashboards (z. B. IT-Betriebsunterbrechungen)
//   - Kann durch Zeitfilter (dim_Kalender) und RLS differenziert werden
// Prinzipien:
//   - Fokussiere dich auf den Wert (zentrale Kennzahl)
//   - Halte es einfach und praktisch (COUNTROWS für schnelles Verständnis)
//   - Arbeite iterativ mit Feedback (in KPI-Analysen einsetzbar)
//

Anzahl Vorgänge = 
COUNTROWS(fact_UngeplanteDowntimes)

//
// Dokumentation
// Maßzahl:    Anzahl TRUE Vorgänge
// Tabelle:    MeasureTable
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   05.06.2025
// Zweck:      Zählt nur ungeplante Downtimes mit tatsächlichem Service Impact (TRUE)
// Beschreibung:
//   - Nutzt CALCULATE zur Filterung der Faktentabelle auf [Service Impact] = TRUE()
//   - Liefert eine reine Anzahl betroffener Vorfälle (KPI)
// Prinzipien:
//   - Fokussiere dich auf den Wert
//   - Halte es einfach und praktisch
//

Anzahl TRUE Vorgänge =
CALCULATE(
    COUNTROWS(fact_UngeplanteDowntimes),
    fact_UngeplanteDowntimes[Service Impact] = TRUE()
)

//
// Dokumentation
// Measure:    TRUE Vorgänge Mai2025
// Tabelle:    MeasureTable
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   10.06.2025
// Zweck:      Zählt die TRUE-Vorgänge im Monat Mai 2025 anhand des Start-Datums
// Beschreibung:
//   - Nutzt COUNTROWS zur Zählung aller Zeilen mit Service Impact = TRUE()
//   - Filtert direkt über die Spalte [Start] aus der Faktentabelle
//   - Umgeht die Kalenderbeziehung für gezielte Monatsauswertungen
// Prinzipien:
//   - Beginne dort, wo du stehst (direkte Feldfilterung)
//   - Fokussiere dich auf den Wert (konkrete Monatsauswertung)
//   - Halte es einfach und praktisch (kein Beziehungswechsel nötig)
//
TRUE Vorgänge Mai2025 = 
CALCULATE(
    COUNTROWS(fact_UngeplanteDowntimes),
    fact_UngeplanteDowntimes[Service Impact] = TRUE(),
    MONTH(fact_UngeplanteDowntimes[Start]) = 5,
    YEAR(fact_UngeplanteDowntimes[Start]) = 2025
)

//
// Dokumentation
// Tabelle:    dim_Kalender
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   04.06.2025
// Zweck:      Bereitstellung einer vollständig modellierten Zeitdimension
// Beschreibung:
//   - Erstellt über DAX-Funktion CALENDAR für die Jahre 2023–2025
//   - Enthält gängige Zeitspalten für Zeitintelligenzfunktionen
//   - Unterstützt Funktionen wie YTD, QTD, MTD und Zeitvergleiche
//   - Wochentagslogik: Montag = 1 (WEEKDAY mit 2 als Typ)
// Prinzipien:
//   - Beginne dort, wo du stehst (definierter Kalenderbereich)
//   - Optimiere und automatisiere (spaltenweise Berechnung)
//   - Arbeite iterativ mit Feedback (erweiterbar bei Bedarf)
//

dim_Kalender = 
ADDCOLUMNS(
    CALENDAR(DATE(2023, 1, 1), DATE(2025, 12, 31)),
    "Jahr", YEAR([Date]),
    "Monat", FORMAT([Date], "MMMM"),
    "MonatNr", MONTH([Date]),
    "Quartal", "Q" & FORMAT([Date], "Q"),
    "Jahr-Monat", FORMAT([Date], "YYYY-MM"),
    "Tag", DAY([Date]),
    "Wochentag", WEEKDAY([Date], 2),
    "WochentagName", FORMAT([Date], "dddd")
)

//
// Dokumentation
// Tabelle:    MeasureTable
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   04.06.2025
// Zweck:      Zentrale Verwaltung und organisatorische Trennung von DAX-Maßzahlen
// Beschreibung:
//   - Dummy-Tabelle ohne Datenbindung
//   - Dient als logische Sammelstelle für Measures
//   - Ermöglicht bessere Übersicht, Wartbarkeit und Rollentrennung
// Prinzipien:
//   - Halte es einfach und praktisch (nur Struktur, keine Daten)
//   - Fördere Transparenz (klare Trennung von Measures und Fakten)
//   - Fokussiere dich auf den Wert (optimiert die Entwicklernavigation)
//

MeasureTable = 
DATATABLE(
    "Measure", STRING, 
    {
        {"Maßzahlen"}
    }
)
