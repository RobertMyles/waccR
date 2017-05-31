# waccR: an R package for analysis of [Aswath Damodaran's](http://people.stern.nyu.edu/adamodar/New_Home_Page/home.htm) weighted cost of capital (WACC) [data](http://people.stern.nyu.edu/adamodar/New_Home_Page/datafile/wacc.htm). 

## installation and usage: 

``` 
if(!require(devtools) install.packages("devtools"))

devtools::install_github("RobertMyles/waccR")

library(waccR)

w_data <- wacc()

```

For more on issues with calculating the WACC, see (for example) [here](https://www2.deloitte.com/content/dam/Deloitte/xe/Documents/About-Deloitte/mepovdocuments/mepov13/dtme_mepov13_Discount%20rates.pdf).
