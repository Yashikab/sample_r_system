fmt:
	Rscript hack/fmt.R

lint:
	Rscript hack/lint.R

check_R:
	Rscript hack/check_status.R

sync_R:
	Rscript hack/synchronize.R
