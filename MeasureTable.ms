//
// Dokumentation
// Measure:    M_Umsatz_YTD
// Projekt:    ITSM_BI_Vorlage_1.0.0
// Tabelle:    MeasureTable
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
// Measure:    TRUE Vorgänge Juni2025
// Tabelle:    MeasureTable
// Projekt:    ITSM_Power_BI_Vorlage_1.0.0
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
TRUE Vorgänge Juni2025 = 
CALCULATE(
    COUNTROWS(fact_UngeplanteDowntimes),
    fact_UngeplanteDowntimes[Service Impact] = TRUE(),
    MONTH(fact_UngeplanteDowntimes[Start]) = 6,
    YEAR(fact_UngeplanteDowntimes[Start]) = 2025
)

//
// Dokumentation
// Measure:    Anzahl iPhones
// Tabelle:    MeasureTable
// Projekt:    ITSM_Power_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   17.06.2025
// Zweck:      Zählt die Anzahl der iPhone-Geräte in der Gerätedimension
// Beschreibung:
//   - Verwendet COUNTROWS auf der Subdimension [dim_Geraet_iphone]
//   - Unabhängig von Filterkontexten (sofern nicht eingeschränkt durch visuelle Filter)
// Prinzipien:
//   - Halte es einfach und praktisch
//   - Fokussiere dich auf den Wert (zentrale Metrik für Gärung)
//   - Arbeite iterativ mit Feedback
//
Anzahl iPhones =
COUNTROWS ( dim_Geraet_iphone )

//
// Dokumentation
// Measure:    Anzahl iPads
// Tabelle:    MeasureTable
// Projekt:    ITSM_Power_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   17.06.2025
// Zweck:      Zählt die Anzahl der iPad-Geräte in der Subdimension
// Beschreibung:
//   - Nutzt COUNTROWS auf der Tabelle [dim_Geraet_ipad]
//   - Kann für KPIs, Filterungen oder Slicer-basierte Visuals verwendet werden
// Prinzipien:
//   - Halte es einfach und praktisch
//   - Beginne dort, wo du stehst (einzelne Typ-Subdimension)
//   - Optimiere und automatisiere (wiederverwendbar in Berichten)
//
Anzahl iPads =
COUNTROWS ( dim_Geraet_ipad )

Netto_Kapazitätsstunden = 
VAR Startzeit = MIN ( fact_UserStory[Anfang] )
VAR Endzeit   = MAX ( fact_UserStory[Erledigt] )

RETURN
CALCULATE (
    COUNTROWS ( dim_Zeit ),
    dim_Zeit[Zeitstempel] >= Startzeit,
    dim_Zeit[Zeitstempel] <= Endzeit,
    dim_Zeit[IstArbeitstag] = TRUE,
    dim_Zeit[Stunde] >= 8,
    dim_Zeit[Stunde] < 17
)

// ---------------------------------------------------------------------
// Dokumentation
// Measure:    Netto_Kapazitätsstunden
// Typ:        Measure
// Tabelle:    Measure
// Projekt:    Kapa_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   25.06.2025
// Zweck:      Berechnung der Netto-Kapazitätsstunden zwischen Anfang und Erledigt
// Beschreibung:
//   - Zählt verfügbare Kapazitätsstunden im Zeitraum (werktags, 08:00–17:00)
//   - Nutzt zwei aktive Beziehungen:
//       -> fact_UserStory[Anfang] -> dim_Zeit[Zeitstempel]
//       -> fact_UserStory[Erledigt] -> dim_Zeit_Ende[Zeitstempel]
//   - Nutzt dim_Zeit-Tabellen mit stündlicher Granularität
//   - Kein Bezug zu konkreten Personen – vollständig anonymisiert
// Datenschutz:
//   - DSGVO-konform und vom Personalrat freigabefähig
//   - Keine personenbezogenen Daten oder Rückschlüsse möglich
//   - Analyse erfolgt ausschließlich auf Team- und Objektebene
// ITIL 4 - Prinzipien:
//   - Fokussiere dich auf den Wert
//   - Denk und arbeite ganzheitlich
//   - Halte es einfach und praktisch
// ---------------------------------------------------------------------
