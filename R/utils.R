#' Retreives column to predict from formula
#'
#' @param formula that is to be parsed
#' @return a string with the column name on the lefthand side of formula
#' @examples
#' col_to_predict(y ~ x + z)
#' col_to_predict(y ~ .)
#' @export
col_to_predict <- function(formula){
  as.character(formula)[2]
}
