#' Trains a very basic dummy regressor model.
#'
#' @param formula that is used during training
#' @param data that is used during training
#' @param strategy that is applied
#' @export
dummy_regressor <- function(formula, data, strategy, constant, quantile, seed){
  obj <- list(strategy=strategy)
  class(obj) <- 'dummy_regressor'
  choices <- c("mean", "median", "constant", "quantile")
  if(!strategy %in% choices){
    stop(paste("strategy", strategy, "is not allowed as a strategy parameter"))
  }
  if(strategy == "mean"){
    obj$value <- data %>%
      dplyr::pull(col_to_predict(formula)) %>%
      mean(na.rm=TRUE)
  }
  if(strategy == "median"){
    obj$value <- data %>%
      dplyr::pull(col_to_predict(formula)) %>%
      median(na.rm=TRUE)
  }
  if(strategy == "constant"){
    obj$value <- constant
  }
  if(strategy == "quantile"){
    obj$quantile <- quantile
    obj$value <- data %>%
      dplyr::pull(col_to_predict(formula)) %>%
      stats::quantile(obj$quantile, na.rm=TRUE)
  }
  if(strategy == "normal"){
    obj$mu <- data %>%
      dplyr::pull(col_to_predict(formula)) %>%
      stats::mean(obj$quantile, na.rm=TRUE)
    obj$sigma <- data %>%
      dplyr::pull(col_to_predict(formula)) %>%
      stats::sd(obj$quantile, na.rm=TRUE)
  }
  obj
}

predict.dummy_regressor <- function(object, newdata){
  value_based <- c('mean', 'median', 'constant', 'quantile')
  if(object$strategy %in% value_based){
    return(as.numeric(rep(object$value, nrow(newdata))))
  }
  if(object$strategy == 'normal'){
    return(rnorm(n=nrow(newdata), object$mu, object$sigma))
  }
  stop("the dummy regression has a strategy that is not recognised")
}

print.dummy_regressor <- function(object){
  cat(paste("dummy_regressor of type", object$strategy))
}
