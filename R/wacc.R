#' @title Downloads and tidies Aswath Damodaran's WACC data
#' @description Downloads and tidies Aswath Damodaran's data on the Weighted Average Cost of Capital by Sector (United States).
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes
#' @importFrom rvest html_table
#' @importFrom dplyr as_data_frame
#' @importFrom dplyr slice
#' @importFrom dplyr mutate
#' @importFrom dplyr mutate_if
#' @importFrom dplyr mutate_at
#' @importFrom magrittr "%>%"
#' @importFrom magrittr set_colnames
#' @details Returns a data frame with the following variables:
#' \itemize{
#'  \item{\code{Industry: }}{economic sector.}
#'  \item{\code{Number_Firms: }}{number of companies in the sector.}
#'  \item{\code{Beta: }}{ Estimated by regressing weekly returns on stock against S&P 500, using 2 years and 5 years of data.}
#'  \item{\code{Cost_Equity: }}{Estimated using the capital asset pricing model: Cost of Equity = Riskfree Rate + Beta (Risk Premium)}
#'  \item{\code{Equity_Debt: }}{Equity/(Debt + Equity).}
#'  \item{\code{Std_Dev_Stock: }}{Standard deviation in stock.}
#'  \item{\code{Cost_Debt: }}{Cost of debt.}
#'  \item{\code{Tax_Rate }}{}
#'  \item{\code{AfterTax_Cost_Debt: }}{Cost of debt after tax.}
#'  \item{\code{Debt_Equity: }}{Debt/(Debt + Equity).}
#'  \item{\code{Cost_Capital: }}{weighted cost of capital, or WACC.}
#' }
#' @seealso For more on the variables in this dataset, see \href{http://people.stern.nyu.edu/adamodar/New_Home_Page/datafile/variable.htm}{this page}.
#' @export
wacc <- function(){

  url <- "http://people.stern.nyu.edu/adamodar/New_Home_Page/datafile/wacc.htm"

  res <- xml2::read_html(url) %>%
    rvest::html_nodes("table") %>%
    rvest::html_table() %>%
    .[[1]] %>%
    dplyr::as_data_frame() %>%
    magrittr::set_colnames(value = c("Industry", "Number_Firms", "Beta",
                             "Cost_Equity", "Equity_Debt", "Std_Dev_Stock",
                             "Cost_Debt", "Tax_Rate", "AfterTax_Cost_Debt",
                             "Debt_Equity", "Cost_Capital")) %>%
    dplyr::slice(-1) %>%
    dplyr::slice(-95:-96) %>%
    dplyr::mutate(Industry = gsub("\\r", "", Industry)) %>%
    dplyr::mutate_if(is.character, gsub, pattern = "%", replacement = "") %>%
    dplyr::mutate_at(dplyr::vars(Number_Firms:Cost_Capital), as.numeric)

  return(res)
}


#' @title Downloads and tidies Aswath Damodaran's industry Beta data
#' @description Downloads and tidies Aswath Damodaran's Beta data for various sectors of US industry.
#' @details Returns a data frame with the following variables:
#' \itemize{
#'  \item{\code{Industry: }}{economic sector.}
#'  \item{\code{Number_Firms: }}{number of companies in the sector.}
#'  \item{\code{Av_Unlevered_Beta: }}{Average Unlevered Beta.}
#'  \item{\code{Av_Levered_Beta: }}{Average Levered Beta.}
#'  \item{\code{Av_Corr_Market: }}{Average Correlation with the market.}
#'  \item{\code{Total_Unlevered_Beta}}
#'  \item{\code{Total_Levered_Beta}}
#' }
#' @examples
#' Beta <- betas()
#' @export
betas <- function(){


  url <- "http://people.stern.nyu.edu/adamodar/New_Home_Page/datafile/totalbeta.html"

  res <- xml2::read_html(url) %>%
    rvest::html_nodes("table") %>%
    rvest::html_table() %>%
    .[[1]] %>%
    dplyr::as_data_frame() %>%
    magrittr::set_colnames(value = c("Industry", "Number_Firms", "Av_Unlevered_Beta",
                                     "Av_Levered_Beta", "Av_Corr_Market",
                                     "Total_Unlevered_Beta", "Total_Levered_Beta")) %>%
    dplyr::slice(-1) %>%
    dplyr::slice(-96:-97) %>%
    dplyr::mutate(Industry = gsub("\\r", "", Industry)) %>%
    dplyr::mutate_if(is.character, gsub, pattern = "%", replacement = "") %>%
    dplyr::mutate_at(dplyr::vars(Number_Firms:Total_Levered_Beta), as.numeric)

  return(res)

}
