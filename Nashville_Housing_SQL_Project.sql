-- Cleaning Data in SQL Queries
select *
from Nashville_Housing

select SaleDate
from Nashville_Housing

-- populate property address data
select *
from Nashville_Housing
where PropertyAddress is null


select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from Nashville_Housing a
join Nashville_Housing b
on a.ParcelID = b.ParcelID
and a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null


update a
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from Nashville_Housing a
join Nashville_Housing b
on a.ParcelID = b.ParcelID
and a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null


-- Breaking out address into individual columns (Address, City, State)
select *
from Nashville_Housing


select SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) as state
from Nashville_Housing

ALTER TABLE Nashville_Housing
ADD PropertySplitAddress NVARCHAR(255);


Update Nashville_Housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1)

ALTER TABLE Nashville_Housing
ADD PropertySplitCity NVARCHAR(255);

Update Nashville_Housing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))


select *
from Nashville_Housing


select 
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
from Nashville_Housing


alter table nashville_Housing
add OwnerSplitAddress Nvarchar(255);

update Nashville_Housing
set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)


Alter table nashville_Housing
add OwnerSplitCity Nvarchar(255);

update Nashville_Housing
set OwnerSplitCity  = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)


alter table nashville_Housing
add OwnerSplitState Nvarchar(255);

update Nashville_Housing
set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)


select *
from Nashville_Housing


alter table nashville_Housing
alter column SoldAsVacant NVARCHAR(5)

update Nashville_Housing
set SoldAsVacant = 
case when SoldAsVacant = '0' then 'No'
else 'Yes'
end


select DISTINCT(SoldAsVacant)
from Nashville_Housing

-- Remove Duplicates
WITH RowNumCTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference
               ORDER BY UniqueID
           ) AS row_num
    FROM Nashville_Housing
)
DELETE FROM RowNumCTE
WHERE row_num > 1;



-- Delete unused columns
alter table Nashville_Housing
drop column OwnerAddress, TaxDistrict, PropertyAddress

select *
from Nashville_Housing

alter table Nashville_Housing
drop column SaleDate

