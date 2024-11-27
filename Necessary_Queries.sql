-- Create database life_exp_analysis
-- Drop table [dbo].[Life_Expectancy]
-- Drop table [dbo].[Adult_Mortality]
-- Drop table [dbo].[Infant_Mortality]
-- Drop table [dbo].[Alcohol_per_Capita]
-- Drop table [dbo].[Health_Expenditure_Percentage_of_GDP]
-- Drop table [dbo].[Hepatitis B_Immunization]
-- Drop table [dbo].[Measles_Reported_Cases]
-- Drop table [dbo].[Under_Five_Deaths]
-- Drop table [dbo].[Polio_Immunization]
-- Drop table [dbo].[Diphtheria_Immunization]
-- Drop table [dbo].[GDP_per_Capita]

-------------------------------------------------------------------------------------------------------------------------------------

select distinct Country from [dbo].[Life_Expectancy]

select Country from [dbo].[Life_Expectancy]
where YEAR BETWEEN 2000 AND 2015
group by Country

-------------------------------------------------------------------------------------------------------------------------------------
---- Tables 
-- Main Table
select * from [dbo].[Life_Expectancy] -- Country | Year | Status | Life Expectancy | BMI | Population | Thinness 1-19 years | Thinness 5-9 years |
-- Income composition of resources | Schooling

-- Subsidaries
select * from [dbo].[Adult_Mortality] -- Adult Mortality
select * from [dbo].[Infant_Mortality] -- Infant Deaths
select * from [dbo].[Alcohol_per_Capita] -- Alcohol
select * from [dbo].[Health_Expenditure_Percentage_of_GDP] -- Percentage Expenditure on health as a percent of GDP
select * from [dbo].[Hepatitis_B_Immunization] -- Hepatitis B (HepB) Immunization
select * from [dbo].[Measles_Reported_Cases] -- Measles
select * from [dbo].[Under_Five_Deaths] -- Under Five Deaths
select * from [dbo].[Polio_Immunization] -- Polio (Pol3) Immunization
select * from [dbo].[Diphtheria_Immunization] -- Diphtheria (DTP3) Immunization
select * from [dbo].[GDP_per_Capita] -- Gross Domestic Product
 
 -- Missing
 -- HIV/AIDS | Total expenditure

-------------------------------------------------------------------------------------------------------------------------------------
 -- Count of Country's 
select count(distinct Country) from [dbo].[Life_Expectancy] -- 183

select count(distinct Country) from [dbo].[Adult_Mortality] -- 183
select count(distinct Country_Name) from [dbo].[Infant_Mortality] -- 244
select count(distinct Country) from [dbo].[Alcohol_per_Capita] -- 189
select count(distinct Country_Name) from [dbo].[Health_Expenditure_Percentage_of_GDP] -- 266
select count(distinct Country) from [dbo].[Hepatitis_B_Immunization] -- 186
select count(distinct Country) from [dbo].[Measles_Reported_Cases] -- 210
select count(distinct Country_Name) from [dbo].[Under_Five_Deaths] -- 266
select count(distinct Country_Name) from [dbo].[Polio_Immunization] -- 266
select count(distinct Country) from [dbo].[Diphtheria_Immunization] -- 195
select count(distinct Country_Name) from [dbo].[GDP_per_Capita] -- 266

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Adult Mortality
select le.Country, le.Year, am.Country, am.Year 
from [dbo].[Life_Expectancy] le full join [dbo].[Adult_Mortality] am
on le.Country = am.Country and le.Year = am.Year

select le.Country, le.Year, am.Country, am.Year 
from [dbo].[Life_Expectancy] le full join [dbo].[Adult_Mortality] am
on le.Country = am.Country and le.Year = am.Year
where le.Country is null or le.Year is null or am.Country is null or am.Year is null

select le.Country as 'LE_Country', am.Country as 'AM_Country'
from [dbo].[Life_Expectancy] le full join [dbo].[Adult_Mortality] am
on le.Country = am.Country
where le.Country is null or am.Country is null or le.Year is null or am.Year is null
group by le.Country, am.Country

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Adult_Mortality] am
on le.Country = am.Country -- 183

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Infant_Mortality
select le.Country, le.Year, im.Country_Name, im.Year 
from [dbo].[Life_Expectancy] le left join [dbo].[Infant_Mortality] im
on le.Country = im.Country_Name and le.Year = im.Year

select le.Country, im.Country_Name
from [dbo].[Life_Expectancy] le left join [dbo].[Infant_Mortality] im
on le.Country = im.Country_Name and le.Year = im.Year
where le.Country is null or im.Country_Name is null or le.Year is null or im.Year is null
group by le.Country, im.Country_Name

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Infant_Mortality] im
on le.Country = im.Country_Name -- 183

/*
Bahamas == Bahamas, The
Bolivia (Plurinational State of) ==  Bolivia
Democratic People's Republic of Korea == Korea, Dem. People's Rep.
Democratic Republic of the Congo == Congo, Dem. Rep.
Egypt == Egypt, Arab Rep.
Gambia == Gambia, The
Iran (Islamic Republic of) == Iran, Islamic Rep.
Kyrgyzstan == Kyrgyz Republic
Lao People's Democratic Republic == Lao PDR
Micronesia (Federated States of) == Micronesia, Fed. Sts.
Republic of Korea = Korea, Rep.
Republic of Moldova == Moldova
Saint Lucia == St. Lucia
Saint Vincent and the Grenadines == St. Vincent and the Grenadines
Slovakia == Slovak Republic
Swaziland == Eswatini
Turkey == Turkiye
United Republic of Tanzania == Tanzania
United States of America == United States
Venezuela (Bolivarian Republic of) == Venezuela, RB
Yemen == Yemen, Rep.
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Alcohol per Capita
select le.Country, apc.Country
from [dbo].[Life_Expectancy] le full join [dbo].[Alcohol_per_Capita] apc
on le.Country = apc.Country --and le.Year = apc.Year
where le.Country is null or apc.Country is null or le.Year is null or apc.Year is null
group by le.Country, apc.Country

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Alcohol_per_Capita] apc
on le.Country = apc.Country -- 182 | 1 Country missing

/*
-- Mising Countries
South Sudan
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Percentage Expenditure on health as a percent of GDP
select le.Country, hep.Country_Name
from [dbo].[Life_Expectancy] le full join [dbo].[Health_Expenditure_Percentage_of_GDP] hep
on le.Country = hep.Country_Name --and le.Year = apc.Year
where le.Country is null or hep.Country_Name is null or le.Year is null or hep.Year is null
group by le.Country, hep.Country_Name

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Health_Expenditure_Percentage_of_GDP] hep
on le.Country = hep.Country_Name -- 183

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Hepatitis B
select le.Country, h.Country
from [dbo].[Life_Expectancy] le full join [dbo].[Hepatitis_B_Immunization] h
on le.Country = h.Country --and le.Year = h.Year
where le.Country is null or h.Country is null or le.Year is null or h.Year is null
group by le.Country, h.Country

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Hepatitis_B_Immunization] h
on le.Country = h.Country -- 174 | 9 Countries missing

select * from [dbo].[Hepatitis_B_Immunization]
where Country in ('Denmark', 'Finland', 'Hungary', 'Iceland', 'Japan', 'Norway', 'Slovenia', 'Switzerland', 'United Kingdom and Northern Ireland')

/*
 -- Missing Countries
Denmark
Finland
Hungary
Iceland
Japan
Norway
Slovenia
Switzerland
United Kingdom and Northern Ireland
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Measles
select le.Country, mrc.Country
from [dbo].[Life_Expectancy] le full join [dbo].[Measles_Reported_Cases] mrc
on le.Country = mrc.Country --and le.Year = apc.Year
where le.Country is null or mrc.Country is null or le.Year is null or mrc.Year is null
group by le.Country, mrc.Country

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Measles_Reported_Cases] mrc
on le.Country = mrc.Country -- 183

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Under Five Deaths
select le.Country, ufd.Country_Name
from [dbo].[Life_Expectancy] le full join [dbo].[Under_Five_Deaths] ufd
on le.Country = ufd.Country_Name --and le.Year = apc.Year
where le.Country is null or ufd.Country_Name is null or le.Year is null or ufd.Year is null
group by le.Country, ufd.Country_Name

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Under_Five_Deaths] ufd
on le.Country = ufd.Country_Name -- 183

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Polio Immunization

select le.Country, pi.Country_Name
from [dbo].[Life_Expectancy] le full join [dbo].[Polio_Immunization] pi
on le.Country = pi.Country_Name --and le.Year = apc.Year
where le.Country is null or pi.Country_Name is null or le.Year is null or pi.Year is null
group by le.Country, pi.Country_Name

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Polio_Immunization] pi
on le.Country = pi.Country_Name -- 183

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and Diphtheria Immunization

select le.Country, di.Country
from [dbo].[Life_Expectancy] le full join [dbo].[Diphtheria_Immunization] di
on le.Country = di.Country --and le.Year = apc.Year
where le.Country is null or di.Country is null or le.Year is null or di.Year is null
group by le.Country, di.Country

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[Diphtheria_Immunization] di
on le.Country = di.Country -- 183

-------------------------------------------------------------------------------------------------------------------------------------
-- Joining Tables
-- Life Expentency and GDP

select le.Country, gdp.Country_Name
from [dbo].[Life_Expectancy] le full join [dbo].[GDP_per_Capita] gdp
on le.Country = gdp.Country_Name --and le.Year = apc.Year
where le.Country is null or gdp.Country_Name is null or le.Year is null or gdp.Year is null
group by le.Country, gdp.Country_Name

select distinct le.Country
from [dbo].[Life_Expectancy] le inner join [dbo].[GDP_per_Capita] gdp
on le.Country = gdp.Country_Name -- 183

-------------------------------------------------------------------------------------------------------------------------------------
-- Analysis Queries

select le.Country, am.Country, im.Country_Name, apc.Country, hep.Country_Name, mrc.Country
from [dbo].[Life_Expectancy] le left join [dbo].[Adult_Mortality] am
on le.Country = am.Country --and le.Year = am.Year
inner join [dbo].[Infant_Mortality] im
on le.Country = im.Country_Name
left join [dbo].[Alcohol_per_Capita] apc
on le.Country = apc.Country -- South Sudan
inner join [dbo].[Health_Expenditure_Percentage_of_GDP] hep
on le.Country = hep.Country_Name
inner join [dbo].[Measles_Reported_Cases] mrc
on le.Country = mrc.Country
group by le.Country, am.Country, im.Country_Name, apc.Country, hep.Country_Name, mrc.Country

select le.Country, hbi.Country
from [dbo].[Life_Expectancy] le left join [dbo].[Hepatitis_B_Immunization] hbi
on le.Country = hbi.Country
group by le.Country, hbi.Country

select am.Country, im.Country_Name
from [dbo].[Adult_Mortality] am inner join [dbo].[Infant_Mortality] im
on am.Country = im.Country_Name and am.Year = im.Year
group by am.Country, im.Country_Name;

select le.Country, le.Year, le.Status, le.Life_expectancy, am.Value as 'Adult_Mortality', im.Value as 'Infant_Mortality',
apc.Value as 'Alcohol_per_Capita', hep.Value as 'Hepatitis_B_Immunization'
from [dbo].[Life_Expectancy] le left join [dbo].[Adult_Mortality] am
on le.Country = am.Country and le.Year = am.Year
left join [dbo].[Infant_Mortality] im
on le.Country = im.Country_Name and le.Year = im.Year
left join [dbo].[Alcohol_per_Capita] apc
on le.Country = apc.Country and le.Year = apc.Year
left join [dbo].[Health_Expenditure_Percentage_of_GDP] hep
on le.Country = hep.Country_Name and le.Year = hep.Year
where le.Country in ('Denmark', 'Finland', 'Hungary', 'Iceland', 'Japan', 'Norway', 'Slovenia', 'Switzerland', 'United Kingdom and Northern Ireland', 'South Sudan')
group by le.Country, le.Year, le.Status, le.Life_expectancy, am.Country, im.Country_Name, apc.Country, hep.Country_Name, am.Value, im.Value,
apc.Value, hep.Value

select * from [dbo].[Hepatitis_B_Immunization]
order by Country

select le.Country, le.Year, am.Value as 'Adult_Mortality', im.Value as 'Infant_Mortality'
from [dbo].[Life_Expectancy] le left join [dbo].[Adult_Mortality] am
on le.Country = am.Country and le.Year = am.Year
left join [dbo].[Infant_Mortality] im
on le.Country = im.Country_Name and le.Year = im.Year
group by le.Country, le.Year, am.Value, im.Value;


select le.Country, le.Year, apc.Value
from [dbo].[Life_Expectancy] le left join [dbo].[Alcohol_per_Capita] apc
on le.Country = apc.Country and le.Year = apc.Year
group by le.Country, le.Year, apc.Value;

select le.Country, le.Year, hbi.Value
from [dbo].[Life_Expectancy] le left join [dbo].[Hepatitis_B_Immunization] hbi
on le.Country = hbi.Country and le.Year = hbi.Year
group by le.Country, le.Year, hbi.Value;

select * from [dbo].[Measles_Reported_Cases]

select le.Country, le.Year, hep.Value as 'Percentage_Expenditure', mrc.Value as 'Measles_Reported_Cases', ufd.Value as 'Under_Five_Deaths', pi.Value as 'Polio_Immunization',
di.Value as 'Diphtheria_Immunization', gdp.Gross_Domestic_Product_per_Capita_in_USD as 'GDP_per_Capita'
from [dbo].[Life_Expectancy] le left join [dbo].[Health_Expenditure_Percentage_of_GDP] hep
on le.Country = hep.Country_Name and le.Year = hep.Year
left join [dbo].[Measles_Reported_Cases] mrc
on le.Country = mrc.Country and le.Year = mrc.Year
left join [dbo].[Under_Five_Deaths] ufd
on le.Country = ufd.Country_Name and le.Year = ufd.Year
left join [dbo].[Polio_Immunization] pi
on le.Country = pi.Country_Name and le.Year = pi.Year
left join [dbo].[Diphtheria_Immunization] di
on le.Country = di.Country and le.Year = di.Year
left join [dbo].[GDP_per_Capita] gdp
on le.Country = gdp.Country_Name and le.Year = gdp.Year
group by le.Country, le.Year, hep.Value, mrc.Value, ufd.Value, pi.Value, di.Value,  gdp.Gross_Domestic_Product_per_Capita_in_USD;

-------------------------------------------------------------------------------------------------------------------------------------
-- Final Table

select * from [dbo].[Adult_Mortality] -- Adult Mortality -- ok
select * from [dbo].[Infant_Mortality] -- Infant Deaths -- ok
select * from [dbo].[Alcohol_per_Capita] -- Alcohol -- ok
select * from [dbo].[Health_Expenditure_Percentage_of_GDP] -- Percentage Expenditure on health as a percent of GDP -- ok
select * from [dbo].[Hepatitis_B_Immunization] -- Hepatitis B (HepB) Immunization -- ok
select * from [dbo].[Measles_Reported_Cases] -- Measles -- ok
select * from [dbo].[Under_Five_Deaths] -- Under Five Deaths -- ok
select * from [dbo].[Polio_Immunization] -- Polio (Pol3) Immunization -- ok
select * from [dbo].[Diphtheria_Immunization] -- Diphtheria (DTP3) Immunization -- ok
select * from [dbo].[GDP_per_Capita] -- Gross Domestic Product -- ok
;


With
LE as
(
select le.Country, le.Year, le.Status, le.Life_expectancy as 'Life_Expectancy', le.BMI, le.Total_expenditure, le.HIV_AIDS, le.Population,
le.thinness_1_19_years as 'Thinness_1_19_Years', le.thinness_5_9_years as 'Thinness_5_9_Years', le.Income_composition_of_resources as 'Income_Composition_of_Resources', le.Schooling
from [dbo].[Life_Expectancy] le
),
NT as
(
select le.Country, le.Year, am.Value as 'Adult_Mortality', im.Value as 'Infant_Mortality'
from [dbo].[Life_Expectancy] le left join [dbo].[Adult_Mortality] am
on le.Country = am.Country and le.Year = am.Year
left join [dbo].[Infant_Mortality] im
on le.Country = im.Country_Name and le.Year = im.Year
group by le.Country, le.Year, am.Value, im.Value
),
MT1 as
(
select le.Country, le.Year, apc.Value as 'Alcohol_per_Capita'
from [dbo].[Life_Expectancy] le left join [dbo].[Alcohol_per_Capita] apc
on le.Country = apc.Country and le.Year = apc.Year
group by le.Country, le.Year, apc.Value
),
MT2 as
(
select le.Country, le.Year, hbi.Value as 'Hepatitis_B_Immunization'
from [dbo].[Life_Expectancy] le left join [dbo].[Hepatitis_B_Immunization] hbi
on le.Country = hbi.Country and le.Year = hbi.Year
group by le.Country, le.Year, hbi.Value
),
PT as 
(
select le.Country, le.Year, hep.Value as 'Percentage_Expenditure', mrc.Value as 'Measles_Reported_Cases', ufd.Value as 'Under_Five_Deaths', pi.Value as 'Polio_Immunization',
di.Value as 'Diphtheria_Immunization', gdp.Gross_Domestic_Product_per_Capita_in_USD as 'GDP_per_Capita'
from [dbo].[Life_Expectancy] le left join [dbo].[Health_Expenditure_Percentage_of_GDP] hep
on le.Country = hep.Country_Name and le.Year = hep.Year
left join [dbo].[Measles_Reported_Cases] mrc
on le.Country = mrc.Country and le.Year = mrc.Year
left join [dbo].[Under_Five_Deaths] ufd
on le.Country = ufd.Country_Name and le.Year = ufd.Year
left join [dbo].[Polio_Immunization] pi
on le.Country = pi.Country_Name and le.Year = pi.Year
left join [dbo].[Diphtheria_Immunization] di
on le.Country = di.Country and le.Year = di.Year
left join [dbo].[GDP_per_Capita] gdp
on le.Country = gdp.Country_Name and le.Year = gdp.Year
group by le.Country, le.Year, hep.Value, mrc.Value, ufd.Value, pi.Value, di.Value,  gdp.Gross_Domestic_Product_per_Capita_in_USD
)
select LE.Country, LE.Year, LE.Status, LE.Life_Expectancy, NT.Adult_Mortality, NT.Infant_Mortality, MT1.Alcohol_per_Capita, PT.Percentage_Expenditure, MT2.Hepatitis_B_Immunization, PT.Measles_Reported_Cases, LE.BMI,
PT.Under_Five_Deaths, PT.Polio_Immunization, LE.Total_expenditure, PT.Diphtheria_Immunization, LE.HIV_AIDS, PT.GDP_per_Capita, LE.Population, LE.Thinness_1_19_Years, LE.Thinness_5_9_Years,
LE.Income_Composition_of_Resources, LE.Schooling
from LE inner join NT
on LE.Country = NT.Country and LE.Year = NT.Year
inner join MT1
on LE.Country = MT1.Country and LE.Year = MT1.Year
inner join MT2
on LE.Country = MT2.Country and LE.Year = MT2.Year
inner join PT
on LE.Country = PT.Country and LE.Year = PT.Year
order by LE.Country, LE.Year desc


-------------------------------------------------------------------------------------------------------------------------------------