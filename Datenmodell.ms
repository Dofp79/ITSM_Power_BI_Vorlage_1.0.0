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

//
// Dokumentation
// Tabelle:    dim_Geraet
// Projekt:    Prod_IT3_AufEinemBlickPower_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   11.06.2025
// Zweck:      Zentrale Gerätedimension für Gärungs- und Inventarberichte
// Beschreibung:
//   - Vereint Geräteinformationen aus [ipad] und [iphone]
//   - Enthält ausschließlich die Spalten Lieferdatum, CI-Typ, Bezeichnung
//   - Zusätzliche Spalte [Geraetetyp] dient zur Identifikation der Quelle
// Prinzipien:
//   - Halte es einfach und praktisch
//   - Denk und arbeite ganzheitlich
//   - Optimiere und automatisiere (einheitliches Datenmodell)
//
dim_Geraet =
UNION (
    SELECTCOLUMNS (
        ipad,
        "Lieferdatum", ipad[Lieferdatum],
        "CI-Typ", ipad[CI-Typ],
        "Bezeichnung", ipad[Bezeichnung],
        "Geraetetyp", "iPad"
    ),
    SELECTCOLUMNS (
        iphone,
        "Lieferdatum", iphone[Lieferdatum],
        "CI-Typ", iphone[CI-Typ],
        "Bezeichnung", iphone[Bezeichnung],
        "Geraetetyp", "iPhone"
    )
)

//
// Dokumentation
// Tabelle:    dim_Geraet
// Projekt:    Prod_IT3_AufEinemBlickPower_BI_Vorlage_1.0.0
// Autor:      Doniman Francisco Peña Parra
// Erstellt:   11.06.2025
// Zweck:      Zentrale Gerätedimension für Filterung, Slicer und Berichtsnavigation
// Beschreibung:
//   - Beinhaltet die gemeinsamen Felder aller Gerätetypen
//   - Dient als Bindeglied zwischen fact_Tabelle und subdim-Geraetetabellen
//   - Ermöglicht typübergreifende Filterung und Drillthrough
// Prinzipien:
//   - Denk und arbeite ganzheitlich
//   - Halte es einfach und praktisch
//   - Optimiere und automatisiere (zentrale Steuerung, mehrfach nutzbar)
//
dim_Geraet =
DISTINCT (
    UNION (
        SELECTCOLUMNS (
            dim_Geraet_ipad,
            "Bezeichnung", dim_Geraet_ipad[Bezeichnung],
            "CI-Typ", dim_Geraet_ipad[CI-Typ],
            "Lieferdatum", dim_Geraet_ipad[Lieferdatum]
        ),
        SELECTCOLUMNS (
            dim_Geraet_iphone,
            "Bezeichnung", dim_Geraet_iphone[Bezeichnung],
            "CI-Typ", dim_Geraet_iphone[CI-Typ],
            "Lieferdatum", dim_Geraet_iphone[Lieferdatum]
        )
    )
)
