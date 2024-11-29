# Plausibilitätsprüfung für Github Actions
Plausi und Vollständigkeit

## Abstimmungsdaten
```sql abstimm
SELECT Abstimmungs_Datum, Name_Resultat_Gebiet,COUNT(*) AS anzahl 
FROM needful_things.abstimm_result
GROUP BY ALL;
```
<AreaChart
    data={abstimm}
    title="Anzahl Datensätze je Tag"
    x=Abstimmungs_Datum
    y=anzahl
    series=Name_Resultat_Gebiet
/>

## Hystreet Fussgängerfrequenzen
```sql hystreet
SELECT DATE_TRUNC('MONTH',timestamp::DATE) tag, COUNT(*) AS anzahl
FROM hystreet
GROUP BY ALL
;
```
<BarChart
    data={hystreet}
    title="Anzahl Datensätze je Tag"
    x=tag
    y=anzahl
/>


## Wetterdaten Wasserpolizei
```sql wapo
WITH wapo AS (
    SELECT 'tiefenbrunnen' as standort,* FROM wapo_tiefenbrunnen
    UNION
    SELECT 'mythenquai' AS standort,* FROM wapo_mythenquai)
SELECT standort, DATE_TRUNC('YEAR',timestamp_cet::DATE) AS tag, COUNT(*) AS anzahl 
FROM wapo 
GROUP BY ALL
```
<BarChart
    data={wapo}
    title="Anzahl Datensätze je Tag"
    x=tag
    y=anzahl
    series=standort
/>

