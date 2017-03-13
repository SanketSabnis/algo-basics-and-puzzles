bfs <- function(graph, node, search) {
	search_queue <- c(node)
	already_seen <- vector()
	while (length(search_queue) > 0) {
		curr_node <- search_queue[1]
		search_queue <- search_queue[-1]
		already_seen <- c(already_seen, curr_node)
		if (curr_node == search) return(already_seen)
		children <- graph[[curr_node]]
		children <- children[!(children %in% already_seen)]
		search_queue <- c(search_queue, children)
	}
	vector()
}

graph <- new.env()
graph[["animal"]] <- c("mammal", "bird", "reptile")
graph[["mammal"]] <- c("canine", "feline")
graph[["canine"]] <- c("dog", "wolf")
graph[["dog"]] <- vector()
graph[["wolf"]] <- vector()
graph[["feline"]] <- c("cat", "tiger")
graph[["cat"]] <- vector()
graph[["tiger"]] <- vector()
graph[["bird"]] <- c("eagle", "parrot", "crow")
graph[["eagle"]] <- vector()
graph[["parrot"]] <- vector()
graph[["crow"]] <- vector()
graph[["reptile"]] <- c("crocodile", "snake", "lizard")
graph[["crocodile"]] <- vector()
graph[["snake"]] <- vector()
graph[["lizard"]] <- vector()
print(bfs(graph, "animal", "dog"))
