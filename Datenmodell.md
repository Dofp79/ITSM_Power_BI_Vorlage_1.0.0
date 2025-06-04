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
