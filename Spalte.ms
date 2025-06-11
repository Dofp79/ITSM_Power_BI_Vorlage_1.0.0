StartDateOnly = DATE(YEAR([Start]), MONTH([Start]), DAY([Start]))
//
// Dokumentation
// Spalte:     StartDateOnly
// Tabelle:    fact_UngeplanteDowntimes
// Projekt:    Prod_IT3_AufEinemBlickPower_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   11.06.2025
// Zweck:      Vereinheitlichung des Datumsformats zur Verknüpfung mit der dim_Kalender
// Beschreibung:
//   - Wandelt das bestehende Datums-Zeit-Feld [Start] in ein reines Datumsfeld (ohne Uhrzeit) um
//   - Ermöglicht eine saubere Beziehung zur Zeitdimension [dim_Kalender[Date]]
//   - Basis für Zeitachsen, Monatsvergleiche und KPI-Trends
//   - Wird ausschließlich für Kalenderbeziehung verwendet (nicht für Reporting anzeigen)
// Prinzipien:
//   - Beginne dort, wo du stehst (bestehendes Feld optimieren)
//   - Optimiere und automatisiere (einmalig erstellte Hilfsspalte, dauerhaft nutzbar)
//   - Halte es einfach und praktisch (minimale Transformation mit maximalem Effekt)
//

