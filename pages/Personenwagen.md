---
title: Personenwagen in Zürich
---


## Neuzulassungen nach Treibstoffart

```sql pw_neu_years
SELECT DISTINCT StichtagDatJahr AS Jahr
FROM pw_neu
ORDER BY 1 DESC;
```

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

<Dropdown data={pw_neu_years} name=Jahr value=Jahr order=Jahr desc/>



```sql pw_neu_treibstoff_kreis
SELECT 
  StichtagDatJahr
  ,FzTreibstoffAgg_noDM AS Treibstoffart 
  ,KreisLang AS Kreis
  ,SUM(FzAnz) AS AnzahlFahrzeuge
FROM pw_neu 
WHERE StichtagDatJahr = '${inputs.Jahr.value}' --(SELECT MAX(StichtagDatJahr) FROM pw_neu)
GROUP BY ALL;
```



<BarChart 
    data={pw_neu_treibstoff_kreis}
    title="Neuzulassungen im Jahr ${inputs.Jahr.value} nach Treibstoffart"
    x=Kreis
    y=AnzahlFahrzeuge
    series=Treibstoffart
    swapXY=true
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