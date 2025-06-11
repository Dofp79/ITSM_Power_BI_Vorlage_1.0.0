Hinweis: Vorbereitung für Zeitachsenanalyse mit StartDateOnly
Um die Visualisierung von TRUE-Vorgängen nach Monat korrekt zu ermöglichen, sind folgende Schritte durchzuführen:

In der Tabelle fact_UngeplanteDowntimes eine neue Spalte StartDateOnly erstellen,
um das Feld Start in ein reines Datum ohne Uhrzeit zu überführen.

Folgende DAX-Formel verwenden:

StartDateOnly = DATE(YEAR([Start]), MONTH([Start]), DAY([Start]))

Im Datenmodell die bestehende Beziehung zwischen Start und dim_Kalender[Date] entfernen,
da diese aufgrund des Uhrzeitanteils nicht zuverlässig funktioniert.

Eine neue Beziehung zwischen StartDateOnly und dim_Kalender[Date] herstellen,
mit folgenden Einstellungen:

Kardinalität: Viele-zu-Eins

Kreuzfilterrichtung: Einfach

In allen zeitbezogenen Visuals die Felder aus dim_Kalender verwenden,
insbesondere Jahr-Monat für Trends und Zeitreihenanalysen.

Die Visualisierung überprüfen, z. B. TRUE-Vorgänge im Monatsverlauf als Linien- oder Balkendiagramm anzeigen.

Optional eine DAX-Dokumentation der Hilfsspalte hinzufügen, gemäß Projektstandard.

Ziel: Durch diese Maßnahme wird sichergestellt, dass Zeitreihenfilter und Kalenderfunktionen zuverlässig auf das tatsächliche Startdatum der Vorgänge angewendet werden können – unabhängig von Uhrzeitkomponenten.



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

