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
  choices <- c("mean", "median")
  if(! strategy %in% choices){
    stop("strategy is not correct")
  }
  if(strategy == "mean"){
    func <- mean
  }
  if(strategy == "median"){
    func <- median
  }
  stat <- data %>%
    dplyr::pull(col_to_predict(formula)) %>%
    func(na.rm=TRUE)
  obj <- list(stat = stat)
  class(obj) <- 'dummy_regressor'
  obj
}

predict.dummy_regressor <- function(object, newdata){
  rep(object$stat, nrow(newdata))
}

print.dummy_regressor <- function(object){
  cat(paste0("dummy_regressor => value:", object$stat))
}
