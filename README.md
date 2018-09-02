# baseliner

The goal of baseliner is to have very basic models that can serve
as a nice baseline for all your ML endeavours. It is nice to be able
to have a baseline that you can beat. 

[![Travis build status](https://travis-ci.org/koaning/baseliner.svg?branch=master)](https://travis-ci.org/koaning/baseliner)

## Installation

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("koaning/baseliner")
```

## Features 

We missed some of the dummy [regressors](http://scikit-learn.org/stable/modules/generated/sklearn.dummy.DummyRegressor.html) 
and [classifiers](http://scikit-learn.org/stable/modules/generated/sklearn.dummy.DummyClassifier.html) available in scikit learn. This repo contains these simple models 
that are fit for benchmarking purposes and some extra ones as well. 

## Example

This is a basic example which shows you how to solve a common problem:

``` r
dataf <- data_frame(val = 1:100, x = 1:100)
mod <- mean_model(val ~ x, data=dataf)
test_data <- data_frame(x = rep(0, 5))
pred <- predict(mod, test_data)
```
