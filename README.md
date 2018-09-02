# baseliner

The goal of baseliner is to ...

[![Travis build status](https://travis-ci.org/koaning/baseliner.svg?branch=master)](https://travis-ci.org/koaning/baseliner)

## Installation

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("koaning/baseliner")
```
## Example

This is a basic example which shows you how to solve a common problem:

``` r
dataf <- data_frame(val = 1:100, x = 1:100)
mod <- mean_model(val ~ x, data=dataf)
test_data <- data_frame(x = rep(0, 5))
pred <- predict(mod, test_data)
```

