.onLoad <- function(libname = find.package("waccR"), pkgname = "waccR"){

  # CRAN Note avoidance
  if(getRversion() >= "2.15.1")
    utils::globalVariables(c(".", "Industry", "Number_Firms", "Cost_Capital",
                             "Total_Levered_Beta"))
  invisible()
}

#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

