Select *
From VideoGameSales..VideoGameSlaes$
where Name is not null
order by 3,4

--SELECTING DATA TO BE USED

Select Name, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Global_Sales
From VideoGameSales..VideoGameSlaes$
order by 1,2

-- COMPARING NA_SALES VS GLOBAL SALES

Select Name, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Global_Sales, (NA_Sales/Global_Sales)*100 as PecentageofSalesNA
From VideoGameSales..VideoGameSlaes$
order by 1,2

-- COMPARING EU_SALES VS GLOBAL SALES

Select Name, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Global_Sales, (EU_Sales/Global_Sales)*100 as PecentageofSalesEU
From VideoGameSales..VideoGameSlaes$
order by 1,2

-- COMPARING JP_SALES VS GLOBAL SALES

Select Name, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Global_Sales, (JP_Sales/Global_Sales)*100 as PecentageofSalesEU
From VideoGameSales..VideoGameSlaes$
order by 1,2

-- VEIWING, BY COMPARING EUROPE SALES RATE PER PLATFORM

Select Platform, MAX(cast(EU_Sales as int)) as TotalNumSalesEU
From VideoGameSales..VideoGameSlaes$
Group by Platform
order by TotalNumSalesEU desc 

-- VEIWING, BY COMPARING NORTH AMERICAN SALES RATE PER PLATFORM

Select Platform, MAX(cast(NA_Sales as int)) as TotalNumSalesNA
From VideoGameSales..VideoGameSlaes$
Group by Platform
order by TotalNumSalesNA desc

-- VEIWING, BY COMPARING JAPANEES SALES RATE PER PLATFORM

Select Platform, MAX(cast(JP_Sales as int)) as TotalNumSalesJP
From VideoGameSales..VideoGameSlaes$
Group by Platform
order by TotalNumSalesJP desc  

-- VEIWING, BY COMPARING GLOBAL SALES RATE PER PLATFORM

Select Platform, MAX(cast(Global_Sales as int)) as TotalNumSalesGlobally
From VideoGameSales..VideoGameSlaes$
Group by Platform
order by TotalNumSalesGlobally desc 


-- VEIWING, BY COMPARING NORTH AMERICAN SALES RATE PER GENRE

Select Genre, MAX(cast(NA_Sales as int)) as TotalNumSalesNA
From VideoGameSales..VideoGameSlaes$
Group by Genre
order by TotalNumSalesNA desc


-- VEIWING, BY COMPARING EUROPE SALES RATE PER GENRE

Select Genre, MAX(cast(EU_Sales as int)) as TotalNumSalesEU
From VideoGameSales..VideoGameSlaes$
Group by Genre
order by TotalNumSalesEU desc

-- VEIWING, BY COMPARING JAPAN SALES RATE PER GENRE

Select Genre, MAX(cast(JP_Sales as int)) as TotalNumSalesJP
From VideoGameSales..VideoGameSlaes$
Group by Genre
order by TotalNumSalesJP desc

-- VEIWING, BY COMPARING GLOBAL SALES RATE PER GENRE

Select Genre, MAX(cast(Global_Sales as int)) as TotalNumSalesGlobally
From VideoGameSales..VideoGameSlaes$
Group by Genre
order by TotalNumSalesGlobally desc


-- VEIWING, BY COMPARING NORTH AMERICA SALES RATE PER PUBLISHER

Select Publisher, MAX(cast(NA_Sales as int)) as TotalNumSalesNA
From VideoGameSales..VideoGameSlaes$
Group by Publisher
order by TotalNumSalesNA desc


-- VEIWING, BY COMPARING EUROPE SALES RATE PER PUBLISHER

Select Publisher, MAX(cast(EU_Sales as int)) as TotalNumSalesEU
From VideoGameSales..VideoGameSlaes$
Group by Publisher
order by TotalNumSalesEU desc

-- VEIWING, BY COMPARING JAPAN SALES RATE PER PUBLISHER

Select Publisher, MAX(cast(JP_Sales as int)) as TotalNumSalesJP
From VideoGameSales..VideoGameSlaes$
Group by Publisher
order by TotalNumSalesJP desc

-- VEIWING, BY COMPARING GLOBAL SALES RATE PER PUBLISHER

Select Publisher, MAX(cast(Global_Sales as int)) as TotalNumSalesglobal
From VideoGameSales..VideoGameSlaes$
Group by Publisher
order by TotalNumSalesglobal desc

-- VEIWING, BY COMPARING NORTH AMERICAN SALES RATE PER NAME

Select Name, MAX(cast(NA_Sales as int)) as TotalNumSalesNA
From VideoGameSales..VideoGameSlaes$
Group by Name
order by TotalNumSalesNA desc

-- VEIWING, BY COMPARING EUROPE SALES RATE PER NAME

Select Name, MAX(cast(EU_Sales as int)) as TotalNumSalesEU
From VideoGameSales..VideoGameSlaes$
Group by Name
order by TotalNumSalesEU desc

-- VEIWING, BY COMPARING JAPAN SALES RATE PER NAME

Select Name, MAX(cast(JP_Sales as int)) as TotalNumSalesJP
From VideoGameSales..VideoGameSlaes$
Group by Name
order by TotalNumSalesJP desc

-- VEIWING, BY COMPARING GLOBAL SALES RATE PER NAME

Select Name, MAX(cast(Global_Sales as int)) as TotalNumSalesglobal
From VideoGameSales..VideoGameSlaes$
Group by Name
order by TotalNumSalesglobal desc

-- VEIWING, BY COMPARING GLOBAL SALES RATE PER YEAR

Select Year, MAX(cast(Global_Sales as int)) as TotalNumSalesglobal
From VideoGameSales..VideoGameSlaes$
Group by Year
order by TotalNumSalesglobal desc