setcovering <- function(sets) {
	items_needed <- vector()
	for (set in ls(sets)) {
		items_needed <- union(items_needed, sets[[set]])
	}
	final_sets <- vector()
	while (length(items_needed) > 0) {
		best_set <- NULL
		items_covered <- vector()
		for (set in ls(sets)) {
			covered <- intersect(items_needed, sets[[set]])
			if (length(covered) > length(items_covered)) {
				best_set <- set
				items_covered <- covered
			}
		}
		if (!is.null(best_set)) {
			final_sets <- c(final_sets, best_set)
			items_needed <- setdiff(items_needed, items_covered)
		}
		else {
			return(vector())
		}
	}
	final_sets
}

sets <- new.env()
sets[["kone"]] <- c("id", "nv", "ut")
sets[["ktwo"]] <- c("wa", "id", "mt")
sets[["kthree"]] <- c("or", "nv", "ca")
sets[["kfour"]] <- c("nv", "ut")
sets[["kfive"]] <- c("ca", "az")
print(setcovering(sets))