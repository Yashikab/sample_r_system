library("renv")

# get status
status <- renv::status()

# check if there are any changes
if (status$synchronize) {
    message("There are no changes in the project library.")
    quit(status = 0)
} else {
    # If there are some change, report it and exit with error
    message("There are changes in the project library.")
    stop("Please run 'renv::snapshot()' to save the changes.")
}

