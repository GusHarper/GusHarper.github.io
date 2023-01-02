clear all
set more off

cd "/Users/gusharper/OneDrive - University of Bristol/2022-2023/Data Science/FinalProject"

capture log close

log using "DifinDifUSEduc.log",replace

* // Setting the working directory and log editor // *

insheet using "DifinDif.csv"

browse

* // There was a lack of available data surrounding this natural experiment, so while this regression will be illustrative it is likely plagued with econometric issues * //


* // While there will be 2 graphs, one on Eudcational attainment and one on Revenue per pupul, there is only enough data for the first regression to be conducted (rpp)* //

* Time Dummy *

gen time1 = year>=1993
replace time1 =. if rpp==.

* dropping data if there's no value for RPP that year *

* Dummy for Massachusetts as treatment group *

gen treated1 = state =="Massachusetts"
replace treated1 =. if rpp==.

* Creating an Interaction Term *

gen did = time1*treated1

* regression *

reg rpp time1 treated1 did

* From the regression, the coefficients are as follows. time1 = -57.7. treated1 = -1219. did = 858.56, with a P value of 0.084. To help illustrate this treatment effect, I'll create a new variable subtracting 858 from  the RPP of massachusets after 1993. I'll then use a few of these data points to include in my graph. *

generate rpp_no_treatment = rpp - 858
replace rpp_no_treatment =. if year <1993
replace rpp_no_treatment =. if state=="MaineandCT"

save dif.in.dif.dta

outsheet using "DifinDivCleaned.csv"

log close
