# devtools
library(devtools)
library(roxygen2)

# create documentation
devtools::document()

# check documentation
devtools::check_man()
# run tests
devtools::test()

# create vignettes
devtools::build_vignettes()

# create bundle
devtools::build()

# install package
devtools::install()
