create database chicago_crime;
use chicago_crime;
select * from crime_data;

-- count the total crime
SELECT COUNT(*) FROM crime_data;

-- Count Arrests		
SELECT COUNT(*) FROM crime_data WHERE Arrest = TRUE;

-- Top 10 Crime Types count		
   SELECT 
   Primary_Type, 
   COUNT(*) AS Crime_Count 
   FROM crime_data 
   GROUP BY Primary_Type
   ORDER BY Crime_Count DESC LIMIT 10;
   
-- Crime by District	
	SELECT 
    District, COUNT(*) 
    FROM crime_data
    GROUP BY District
    ORDER BY District;
    
-- Arrest Rate per Type	
	SELECT 
    Primary_Type, Arrest, 
    COUNT(*) FROM crime_data 
    GROUP BY Primary_Type, Arrest;
    
-- Domestic vs Non-Domestic	
	SELECT Domestic, 
    COUNT(*) FROM crime_data
    GROUP BY Domestic;
    
-- Arrest vs non-arrest
   SELECT 
   Arrest, COUNT(*) AS Count 
   FROM crime_data GROUP BY Arrest;
   
-- Crime Trend	Monthly trend	
    SELECT
    YEAR(Date) AS Year, MONTH(Date) AS Month,
    COUNT(*) FROM crime_data 
    GROUP BY YEAR(Date), MONTH(Date) 
    ORDER BY Year, Month;

-- crime distribution by ward
     SELECT  
     Ward, COUNT(*) AS Crimes 
     FROM crime_data 
     GROUP BY Ward 
     ORDER BY Crimes DESC;

-- day of week crime count
   SELECT 
   DAYNAME(Date) AS DayOfWeek, 
   COUNT(*) AS Count 
   FROM crime_data 
   GROUP BY DayOfWeek;

-- Hourly crime distribution
  SELECT 
  HOUR(Date) AS Hour, 
  COUNT(*) AS Count 
  FROM crime_data 
  GROUP BY Hour 
  ORDER BY Hour;

-- Top 10 location where crimes occur
  SELECT 
  Location_Description, 
  COUNT(*) AS Count 
  FROM crime_data 
  GROUP BY Location_Description 
  ORDER BY Count DESC 
  LIMIT 10;

-- Arrest rate by crime type
  SELECT 
  Primary_Type, 
  ROUND(100 * SUM(CASE WHEN Arrest = TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS Arrest_Rate 
  FROM crime_data 
  GROUP BY Primary_Type;