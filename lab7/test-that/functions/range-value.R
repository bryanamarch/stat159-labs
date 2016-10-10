range_value <- function(x, na.rm = FALSE){
	if (na.rm) {x <- x[!is.na(x)]}
	max(x)-min(x)
}

