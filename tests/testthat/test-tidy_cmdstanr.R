test_that("renaming works", {

  expect_equal(posterior %>% tidy_cmdstanr(),posterior_clean)
})
