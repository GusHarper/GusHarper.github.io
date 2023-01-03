clear all
set more off

cd "/Users/gusharper/OneDrive - University of Bristol/2022-2023/Data Science/FinalProject/Data"

capture log close

log using "PerPupilExpenditure.log",replace

* // Setting the working directory and log editor // *

insheet using "PerPupilSpending.csv"

browse
describe
sum

* // The  issue with this dataset is we have  aggregate expenditure for each year in nominal terms, so we want to reabse this spending to make it real expenditure using a CPI index with 2015 as a base year. (Source: ONS)* //

generate expenditure_real = avgexpenditureperpupil*100/cpi2015base


* //  drop the previous columns to clean up the data // *

drop avgexpenditureperpupil

browse

save total.expenditure.per.pupil.dta

outsheet using "PerPupilExpenditureCleaned.csv"

log close
 

















