fibonacci <- function(n) {
  if (n < 0) {
    stop("n must be non-negative")
  } else if (n <= 1) {
    return(n)
  } else {
    return(fibonacci(n - 1) + fibonacci(n - 2))
  }
}
