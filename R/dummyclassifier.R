#' Trains a very basic dummy classifier model.
#'
#' @param formula that is used during training
#' @param data that is used during training
#' @param strategy that is applied
#' @export
dummy_classifier <- function(formula, data, strategy, constant, quantile, seed){
  object <- list(strategy=strategy)
  class(object) <- 'dummy_classifier'
  choices <- c('most_frequent', 'constant', 'stratified', 'uniform')
  object$col <- col_to_predict(formula)
  if(!strategy %in% choices){
    stop(paste("strategy", strategy, "is not allowed as a strategy parameter"))
  }
  if(strategy == "most_frequent"){
    object$value <- data %>%
      group_by_(col_to_predict(formula)) %>%
      count() %>%
      arrange(-n) %>%
      pull(col_to_predict(formula)) %>%
      head(1)
  }
  if(strategy == "constant"){
    aggregated_df <- data %>%
      group_by_(col_to_predict(formula)) %>%
      count()
    possible_values <- aggregated_df[[col_to_predict(formula)]]
    if(! constant %in% possible_values){
      msg <- paste("given constant value:", constant, "is not in", possible_values)
      stop(msg)
    }
    object$value <- constant
  }
  if(strategy == "stratisfied"){
    object$prob_df <- data %>%
      group_by_(col_to_predict(formula)) %>%
      count() %>%
      ungroup() %>%
      arrange(-n) %>%
      mutate(p = n/sum(p))
  }
  if(strategy == "uniform"){
    object$prob_df <- data %>%
      group_by_(col_to_predict(formula)) %>%
      count() %>%
      ungroup() %>%
      arrange(-n) %>%
      mutate(p = 1/nrow(.))
  }
  object
}

predict.dummy_classifier <- function(object, newdata){
  if(exists("value", where=object)){
    return(rep(object$value, nrow(newdata)))
  }
  if(exists("prob_df", where=object)){
    classes <- object$prob_df[object$col]
    probabilities <- object$prob_df$prob
    return(sample(classes, size = nrow(newdata), replace = TRUE, prob = probabilities))
  }
  stop("the dummy classifier has a strategy that is not recognised")
}

print.dummy_classifier <- function(object){
  cat(paste("dummy_classifier of type", object$strategy))
}
