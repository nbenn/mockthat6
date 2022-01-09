
#' @importFrom RCurl getURL
#' @importFrom curl curl_fetch_memory
my_curl <- function(url, ..., pkg = c("RCurl", "curl")) {
	switch(
    match.arg(pkg),
    RCurl = getURL(url, ...),
    curl = curl_fetch_memory(url, ...)
  )
}
