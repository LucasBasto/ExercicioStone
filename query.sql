Questão 1- -------------------------------------------------------------------------------------

SELECT block_number, count (distinct address) FROM `bigquery-public-data.crypto_ethereum.tokens` 
group by block_number;

Questão 2 - ------------------------------------------------------------------------------------

SELECT  cast(block_timestamp as date) as Date_block,
count (distinct block_number) as Qty_block from `bigquery-public-data.crypto_ethereum.tokens` 
group by Date_block
order by date_block desc;

Questão 3- --------------------------------------------------------------------------------------

SELECT  cast(block_timestamp as date) as Date_block,
count (distinct block_number) as Valor_Final,

(SELECT Cast(block_timestamp as date) +1 as Date2,
count(distinct block_number) as block2 FROM `bigquery-public-data.crypto_ethereum.tokens`) as Valor_Inicial,

(Valor_Final/Valor_Inicial -1 )*100 as Variacao 

from `bigquery-public-data.crypto_ethereum.tokens` 
where cast(block_timestamp as date) > DATE_SUB(current_date(), INTERVAL 15 day)
group by Date_block
order by date_block desc;



4 -----------------------------------------------------------------------------------

SELECT  cast(block_timestamp as date) as Date_Address,
count (distinct block_address) as Valor_Final,

(SELECT Cast(block_timestamp as date) +1 as,
count(distinct block_address) as block2 FROM `bigquery-public-data.crypto_ethereum.tokens`) as Valor_Inicial,

(Valor_Final/Valor_Inicial -1 )*100 as Variacao 

from `bigquery-public-data.crypto_ethereum.tokens` 
where cast(block_timestamp as date) > DATE_SUB(current_date(), INTERVAL 15 day)
group by Date_address
order by date_address desc;
