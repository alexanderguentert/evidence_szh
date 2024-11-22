SELECT *
    , 'https://data.stadt-zuerich.ch/dataset/'||dataset_name AS dataset_url 
FROM read_csv("https://data.stadt-zuerich.ch/dataset/prd_ssz_ogd_katalog_inventar/download/ogd_katalog_inventar.csv");
