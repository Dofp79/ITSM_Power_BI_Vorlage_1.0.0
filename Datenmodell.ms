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
