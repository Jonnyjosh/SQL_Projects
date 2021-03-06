
-- Cleaning Data in SQL Quaries

Select *
From SQLdataClean..Nashvhouse

-- STANDARDIZE DATA FORMAT (SALE DATE)
--- CONVERTING FROM DATE/TIME FORMAT TO ORDINARY DATE FORMAT

Select SalesDateCleaned, CONVERT(Date,saleDate)
From SQLdataClean..Nashvhouse

Update Nashvhouse
Set SaleDate = CONVERT(Date,saleDate)

--OR

ALTER TABLE Nashvhouse
Add SalesDateCleaned Date;

Update Nashvhouse
Set SalesDateCleaned = CONVERT(Date,saleDate)


-- CLEAN PROPERTY ADDRESS DATA (POPULATING NULL VALUE)
--- JOINING THE TABLE TO ITSELF (I.E, IF X=Y THEN Y=X)

Select *
From SQLdataClean..Nashvhouse
Order by ParcelID

-- JOINING THE TABLE TO ITSELF (I.E, IF X=Y THEN Y=X)

Select J.ParcelID, J.PropertyAddress, O.ParcelID, O.PropertyAddress, ISNULL(J.PropertyAddress, O.PropertyAddress) 
From SQLdataClean..Nashvhouse J
JOIN SQLdataClean..Nashvhouse O
     ON J.ParcelID = O.ParcelID
	 AND J.[UniqueID ] <> O.[UniqueID ]
WHERE J.PropertyAddress IS NULL


UPDATE J
SET PropertyAddress = ISNULL(J.PropertyAddress, O.PropertyAddress) 
From SQLdataClean..Nashvhouse J
JOIN SQLdataClean..Nashvhouse O
     ON J.ParcelID = O.ParcelID
	 AND J.[UniqueID ] <> O.[UniqueID ]
WHERE J.PropertyAddress IS NULL


-- BREAKING OUT ADDRESS INT INDIVIDUAL COLUMNS (ADDRESS, CITY, STATE)

Select PropertyAddress
From SQLdataClean..Nashvhouse

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) AS Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) AS Address
FROM SQLdataClean..Nashvhouse

--- CREATING TWO NEW COLUMNS 

ALTER TABLE Nashvhouse
Add PropertyseperatedAddrs nvarchar(255);

Update Nashvhouse
Set PropertyseperatedAddrs = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) 


ALTER TABLE Nashvhouse
Add PropertyseperatedCity nvarchar(255);

Update Nashvhouse
Set PropertyseperatedCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))

--CHECK
SELECT *
FROM SQLdataClean..Nashvhouse


--CREATING THREE NEW COLUMNS 

SELECT OwnerAddress
FROM SQLdataClean..Nashvhouse



SELECT 
PARSENAME(REPLACE(OwnerAddress,',','.'), 3),
PARSENAME(REPLACE(OwnerAddress,',','.'), 2),
PARSENAME(REPLACE(OwnerAddress,',','.'), 1)
FROM SQLdataClean..Nashvhouse



ALTER TABLE Nashvhouse
Add OwnerseperatedAddrs nvarchar(255);

Update Nashvhouse
Set OwnerseperatedAddrs = PARSENAME(REPLACE(OwnerAddress,',','.'), 3)


ALTER TABLE Nashvhouse
Add OwnerseperatedCity nvarchar(255);

Update Nashvhouse
Set OwnerseperatedCity = PARSENAME(REPLACE(OwnerAddress,',','.'), 2)


ALTER TABLE Nashvhouse
Add OwnerseperatState nvarchar(255);

Update Nashvhouse
Set OwnerseperatState = PARSENAME(REPLACE(OwnerAddress,',','.'), 1) 

--CHECK

SELECT *
FROM SQLdataClean..Nashvhouse


--CONVERTING 'Y' AND 'N' TO YES OR NO IN (SOLD AS VACANT) FIELD 


SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM SQLdataClean..Nashvhouse
GROUP BY SoldAsVacant
ORDER BY 2


SELECT SoldAsVacant,
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END
FROM SQLdataClean..Nashvhouse

UPDATE Nashvhouse
SET SoldAsVacant  = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END

-- GETTING RID OF DUPLICATES
---FINDING DUPLICATES VALUES

WITH RowNumCTE AS(
SELECT *,
      ROW_NUMBER() OVER (
	  PARTITION BY ParcelID,
	               PropertyAddress,
				   SalePrice,
				   SaleDate,
				   LegalReference
				   ORDER BY
				       UniqueID
					   ) row_num
 FROM SQLdataClean..Nashvhouse)
DELETE 
 FROM RowNumCTE
WHERE row_num > 1


-- DELETING UNUSED COLUMN

ALTER TABLE SQLdataClean..Nashvhouse
DROP COLUMN OwnerAddress, PropertyAddress, taxDistrict 

ALTER TABLE SQLdataClean..Nashvhouse
DROP COLUMN SaleDate


--CHECK
SELECT *
FROM SQLdataClean..Nashvhouse