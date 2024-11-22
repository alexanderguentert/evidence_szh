---
title: Personenwagen in Zürich
---


## Neuzulassungen nach Treibstoffart

```sql pw_neu_treibstoff
SELECT 
  StichtagDatJahr
  ,FzTreibstoffAgg_noDM AS Treibstoffart 
  ,SUM(FzAnz) AS AnzahlFahrzeuge
FROM pw_neu 
GROUP BY ALL;
```
<BarChart
    data={pw_neu_treibstoff}
    title="Neuzulassungen von Personenwagen nach Treibstoffart"
    x=StichtagDatJahr
    y=AnzahlFahrzeuge
    series=Treibstoffart
/>

## Bestand nach Treibstoffart

```sql pw_bestand_treibstoff
SELECT 
  StichtagDatJahr
  ,FzTreibstoffAgg_noDM AS Treibstoffart 
  ,SUM(FzAnz) AS AnzahlFahrzeuge
FROM pw_bestand
GROUP BY ALL;
```

<BarChart
    data={pw_bestand_treibstoff}
    title="Bestand Personenwagen nach Treibstoffart"
    x=StichtagDatJahr
    y=AnzahlFahrzeuge
    series=Treibstoffart
/>