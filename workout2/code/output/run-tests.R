# This R script file runs tests to test minkowski(), is_hex(), is_hex_alpha(), reverse_chars(), and count_vowels().

library('testthat')

functions <- dir('../functions')
lapply(paste0('../functions/', functions), source)

sink(file = 'test-output.txt')
test_dir('../tests')
sink()