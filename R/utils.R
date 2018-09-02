#' Retreives column to predict from formula
#'
#' @param formula that is to be parsed
#' @return a string with the column name on the lefthand side of formula
#' @examples
#' cols_to_explain(y ~ x + z)
#' cols_to_explain(y ~ .)
#' @export
col_to_predict <- function(formula){
  as.character(formula)[2]
}
