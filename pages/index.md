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


```sql inv_sankey
WITH kategorien AS (
  SELECT 
    titel, 
    UNNEST(STRING_SPLIT(kategorie,', ')) AS kategorie , 
    aktualisierungsdatum, 
    raeumliche_beziehung,
    quelle --split_part(quelle,', ',-1) AS quelle
  FROM ogd_inventar
), kategorien_group1 AS (
  SELECT 
    kategorie AS source, 
    raeumliche_beziehung AS target, 
    count() AS count --, ARRAY_AGG(DISTINCT titel)
  FROM kategorien
  GROUP BY ALL
  ORDER BY 1
), kategorien_group2 AS (
  SELECT 
    quelle AS source, 
    kategorie AS target, 
    count() AS count
  FROM kategorien
  GROUP BY ALL
)

SELECT *
FROM kategorien_group1
UNION ALL SELECT * FROM kategorien_group2
;
```

<SankeyDiagram
    data={inv_sankey}
    title="Sankey"
    subtitle="A simple sankey chart"
    sourceCol=source
    targetCol=target
    valueCol=count
/>
