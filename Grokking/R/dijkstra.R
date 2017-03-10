find_lowest_cost_node <- function(costs, not_processed) {
	lowest_cost_node <- NULL
	lowest_cost <- Inf
	for (node in ls(costs)) {
		if (costs[[node]] < lowest_cost && node %in% not_processed) {
			lowest_cost_node <- node
			lowest_cost <- costs[[node]]
		}
	}
	lowest_cost_node
}

dijkstra <- function(graph) {
	costs <- new.env()
	parents <- new.env()
	for (node in ls(graph[["start"]])) {
		costs[[node]] <- graph[["start"]][[node]]
		parents[[node]] <- "start"
	}
	not_processed <- ls(graph)
	while (length(not_processed) > 0) {
		node <- find_lowest_cost_node(costs, not_processed)
		if (is.null(node)) break
		cat("lowest cost is", node, "\n")
		for (neighbor in ls(graph[[node]])) {
			new_cost <- costs[[node]] + graph[[node]][[neighbor]]
			if (!(neighbor %in% ls(costs)) || new_cost < costs[[neighbor]]) {
				costs[[neighbor]] <- new_cost
				parents[[neighbor]] <- node
				cat("\tnew cost of", neighbor, "is", new_cost, "\n")
				cat("\tnew parent of", neighbor, "is", node, "\n")
			}
		}
		not_processed <- not_processed[not_processed != node]
	}
	ret_vec <- c("fin")
	node <- "fin"
	while (node != "start") {
		node <- parents[[node]]
		ret_vec <- c(ret_vec, node)
	}
	ret_vec
}

graph <- new.env()
graph[["start"]] <- new.env()
graph[["start"]][["a"]] <- 6
graph[["start"]][["b"]] <- 2
graph[["a"]] <- new.env()
graph[["a"]][["fin"]] <- 1
graph[["b"]] <- new.env()
graph[["b"]][["a"]] <- 3
graph[["b"]][["fin"]] <- 5
print(dijkstra(graph))

graph <- new.env()
graph[["start"]] <- new.env()
graph[["start"]][["lp"]] <- 5
graph[["start"]][["poster"]] <- 0
graph[["lp"]] <- new.env()
graph[["lp"]][["guitar"]] <- 15
graph[["lp"]][["drums"]] <- 20
graph[["poster"]] <- new.env()
graph[["poster"]][["guitar"]] <- 30
graph[["poster"]][["drums"]] <- 35
graph[["guitar"]] <- new.env()
graph[["guitar"]][["fin"]] <- 20
graph[["drums"]] <- new.env()
graph[["drums"]][["fin"]] <- 10
print(dijkstra(graph))
