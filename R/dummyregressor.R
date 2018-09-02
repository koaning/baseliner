col_to_predict <- function(formula){
  as.character(formula)[2]
}

col_to_explain <- function(formula){
  formula %>%
    as.character() %>%
    .[3] %>%
    stringr::str_split("\\+") %>%
    .[[1]] %>%
    stringr::str_trim()
}


#' Trains a very basic dummy regressor model.
#'
#' @param formula that is used during training
#' @param data that is used during training
#' @param strategy that is applied
#' @export
dummy_regressor <- function(formula, data, strategy){
  obj <- list(strategy=strategy)
  class(obj) <- 'dummy_regressor'
  choices <- c("mean", "median")
  if(!strategy %in% choices){
    stop("strategy is not correct")
  }
  if(strategy == "mean"){
    obj$value <- data %>%
      pull(col_to_predict(formula)) %>%
      mean(na.rm=TRUE)
  }
  if(strategy == "median"){
    obj$value <- data %>%
      pull(col_to_predict(formula)) %>%
      mean(na.rm=TRUE)
  }
  obj
}

predict.dummy_regressor <- function(object, newdata){
  if(object$strategy %in% c('mean', 'median')){
    return(rep(object$value, nrow(newdata)))
  }
}

print.dummy_regressor <- function(object){
  cat("dummy_regressor")
}
