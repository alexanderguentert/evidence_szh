---
title: Open Data Stadt Zürich Dashboard
---

Dashboard zum Herumprobieren mit Open Data der Stadt Zürich

## Dateninventar
Verfügbare Datensets auf https://data.stadt-zuerich.ch/

```sql inventar
SELECT *
FROM ogd_inventar;
```

<DataTable data={inventar} search=true rowShading=true 
    sortable=true compact=false rows=20>
  <Column id=titel wrap=true/>
  <Column id=kategorie wrap=true/>
  <Column id=raeumliche_beziehung />
  <Column id=zeitraum />
  <Column id=datentyp />
  <Column id=aktualisierungsdatum />
	<Column id=dataset_url contentType=link openInNewTab=true/>
</DataTable>
