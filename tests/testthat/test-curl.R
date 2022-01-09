
url <- "https://eu.httpbin.org/get?foo=123"

test_that("test curl", {

  res <- my_curl(url, pkg = "curl")
  expect_type(rawToChar(res$content), "character")

  res <- mockthat::with_mock(
    curl_fetch_memory = 42,
    my_curl(url, pkg = "curl")
  )

  expect_type(res, "double")
})

test_that("test RCurl", {

  res <- my_curl(url, pkg = "RCurl")
  expect_type(res, "character")

  res <- mockthat::with_mock(
    getURL = 42,
    my_curl(url, pkg = "RCurl")
  )

  expect_type(res, "double")
})
