library("renv")
renv::repair()
library("lintr")

result <- lintr::lint_dir("src")

if (length(result) > 0 ) {
    print(result)
    stop("Linting failed")
} else {
    print("Linting passed")
}
