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

#' Trains a very basic mean model.
#'
#' @param formula that is used during training
#' @param data that is used during training
#' @export
mean_model <- function(formula, data){
  mean_value <- data %>%
    dplyr::pull(col_to_predict(formula)) %>%
    mean(na.rm=TRUE)
  obj <- list(mean = mean_value)
  class(obj) <- 'mean_model'
  obj
}

predict.mean_model <- function(object, newdata){
  rep(object$mean, nrow(newdata))
}

print.mean_model <- function(object){
  cat(paste0("baseliner.mean_model => value:", object$mean))
}
