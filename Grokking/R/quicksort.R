quicksort <- function(vec) {
	if (length(vec) < 1) return(vec)
	pivot <- vec[1]
	left <- vec[vec < pivot]
	right <- vec[vec > pivot]
	c(quicksort(left), vec[vec == pivot], quicksort(right))
}

print(quicksort(c(8, 2, 6, 5, 1, 3, 7)))
print(quicksort(c("Zebra", "Bird", "Panda", "Dog", "Cat")))
