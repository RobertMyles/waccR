
<!-- README.md is generated from README.Rmd. Please edit that file -->
waccR
=====

`waccr` is an R package for the analysis of [Aswath Damodaran's](http://people.stern.nyu.edu/adamodar/New_Home_Page/home.htm) weighted cost of capital (WACC) [data](http://people.stern.nyu.edu/adamodar/New_Home_Page/datafile/wacc.htm). It simply downloads and tidies Professor Damodaran's data into R.

installation and usage:
-----------------------

``` r

devtools::install_github("RobertMyles/waccR")

library(waccR)

w_data <- wacc()
```

WACC
----

The Weighted Average Cost of Capital (WACC) represents the average cost of financing a company's debt and equity. There are two approches to calculating it, one based on the "Build-up" approach, the other on the Capital Assets Pricing Model (CAPM) approach.

*W**A**C**C* = *K*<sub>*e*</sub> × *W*<sub>*e*</sub> + *K*<sub>*d*</sub> × *W*<sub>*d*</sub>

where *K*<sub>*d*</sub> is the after-tax cost of debt, *W*<sub>*e*</sub> and *W*<sub>*d*</sub> the proportion of equity and debt in a firm based on market value, and *K*<sub>*e*</sub> is the cost of equity, which, using the CAPM approach, is calculated with:

*K*<sub>*e*</sub> = *R*<sub>*f*</sub> + *β*(*R*<sub>*m*</sub>)+*R*<sub>*s*</sub> + *C**R* + *F**R*

where *R*<sub>*f*</sub> is risk-free rate, *R*<sub>*m*</sub> is the market premium, *R**s* is the company size premium, *C**R* the [country risk premium](https://github.com/RobertMyles/riscoBrasil), FR the firm-specific risk and *β* is a measure of the systematic risk, usually of the industry sector, in comparison to the market as a whole.

*β* for various sectors of US industry is available with:

``` r
betas()
#> # A tibble: 94 x 7
#>                 Industry Number_Firms Av_Unlevered_Beta Av_Levered_Beta
#>                    <chr>        <dbl>             <dbl>           <dbl>
#>  1           Advertising           41              0.91            1.36
#>  2     Aerospace/Defense           96              0.94            1.07
#>  3         Air Transport           18              0.76            1.12
#>  4               Apparel           58              0.71            0.88
#>  5          Auto & Truck           15              0.38            0.85
#>  6       Auto      Parts           63              0.94            1.12
#>  7   Bank (Money Center)           10              0.41            0.86
#>  8 Banks      (Regional)          645              0.36            0.47
#>  9  Beverage (Alcoholic)           25              0.71            0.79
#> 10  Beverage      (Soft)           36              0.78            0.91
#> # ... with 84 more rows, and 3 more variables: Av_Corr_Market <dbl>,
#> #   Total_Unlevered_Beta <dbl>, Total_Levered_Beta <dbl>
```

For more, see Professor Damodaran's webpage: <http://people.stern.nyu.edu/adamodar/>
