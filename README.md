# Abfahrts-Dashboard
Das Ziel dieses Projekts ist es, die live Abfahrtszeiten von der Haltestelle bei meiner Wohnung Richtung Bahnhof anzuzeigen.
Die Abfrage der Daten erfolgt über die HAFAS API. Im späteren Verlauf soll eine Karte eingeblendet werden, die mehr oder weniger die Live Position der Straßenbahn (Bus) anzeigt.

In Zukunft soll das Projekt so gestaltet werden, dass jede verfügbare Haltestelle als Start oder Endziel genommen werden.

Damit die Abfrage erfolgen kann, muss unter [/interface](backend/config.ini) in der config.ini der API Key entsprechend angepasst werden.


## Aufbau Datenbank
Informationen der Datenbank unter [Datenbank](doc/database.md)