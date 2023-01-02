clear all
set more off

cd "/Users/gusharper/OneDrive - University of Bristol/2022-2023/Data Science/FinalProject/Data"

capture log close

log using "GovernmentSpending.log",replace

* // Setting the working directory and log editor // *

insheet using "GovernmentExpenditureCPI.csv"

browse
describe
sum

* // The main issue with this dataset is we have only the aggregate spending for each year in nominal terms. Ideally, we want to reabse this spending to make it real expenditure, and we want to convert to percentage (of total expenditure) // *

* // First, I will adjust aggregate spending figures to real terms // using a CPI index with 2015 as a base year. (Source: ONS)* //

generate debtinterest_real = debtinterest*100/cpi2015base

generate other_real = otherincludingeutransactions*100/cpi2015base

generate publicorderandsafety_real = publicorderandsafety*100/cpi2015base

generate housingandenvironment_real = housingandenvironment*100/cpi2015base

generate industryemployment_real = industryagricultureandemployment*100/cpi2015base

generate defence_real = defence*100/cpi2015base

generate education_real = education*100/cpi2015base

generate transport_real = transport*100/cpi2015base

generate socialprotection_real = socialprotection*100/cpi2015base

generate personalsocialservices_real = personalsocialservices*100/cpi2015base

generate health_real = health*100/cpi2015base

generate total_real = total*100/cpi2015base

* // Had to shorten the names for some of them as stata said they were too long // *

* // Now, I'm going to generate a final variable that has the expenditure of each area as a % of total expenditure for that year // *

generate debtinterestFINAL = debtinterest_real/total_real

generate otherFINAL = other_real/total_real

generate publicorderandsafetyFINAL = publicorderandsafety_real/total_real

generate housingandenvironmentFINAL = housingandenvironment_real/total_real

generate industryemploymentFINAL = industryemployment_real/total_real

generate defenceFINAL = defence_real/total_real

generate educationFINAL = education_real/total_real

generate transportFINAL = transport_real/total_real

generate socialprotectionFINAL = socialprotection_real/total_real

generate personalsocialservicesFINAL = personalsocialservices_real/total_real

generate healthFINAL = health_real/total_real

* // Now, I am going to drop the previous columns to clean up the data // *

drop debtinterest
drop otherincludingeutransactions
drop publicorderandsafety
drop housingandenvironment
drop industryagricultureandemployment
drop defence
drop education
drop transport 
drop socialprotection 
drop personalsocialservices
drop health 
drop total 

browse

* // Data Set looks complete, now I'll just save the data set and download it as a CSV file // *

save government.spending.cleaned.dta

outsheet using "GovernmentExpenditureCleaned.csv"

log close
 
* // while the format of this dataset is practical for cleaning, I will rearrange it manually in excel for ease when making the grpah in vega* //

















