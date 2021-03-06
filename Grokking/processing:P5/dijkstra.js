

function setup() {
	var graph = {};
	graph["start"] = {};
	graph["start"]["A"] = 6;
	graph["start"]["B"] = 2;
	graph["A"] = {};
	graph["B"] = {};
	graph["A"]["FIN"] = 1;
	graph["B"]["A"] = 3;
	graph["B"]["FIN"] = 5;
	graph["FIN"] = {};
	console.log(dijkstra(graph, "start", "FIN"));


	var trade = {};
	trade["book"] = {};
	trade["book"]["LP"] = 5;
	trade["book"]["poster"] = 0;
	trade["poster"] = {};
	trade["poster"]["guitar"] = 30;
	trade["poster"]["drums"] = 35;
	trade["LP"] = {};
	trade["LP"]["guitar"] = 15;
	trade["LP"]["drums"] = 20;
	trade["guitar"] = {};
	trade["guitar"]["piano"] = 20;
	trade["drums"] = {};
	trade["drums"]["piano"] = 10;
	trade["piano"] = {};
	console.log(dijkstra(trade, "book", "piano"));
}		


function findLowestCostNode(costs, unprocessed) {
	var lowestNode = null;
	var lowestNodeCost = Infinity;
	for(var i in costs){
		var cost = costs[i];
		if((cost < lowestNodeCost) && (i in unprocessed)){
			lowestNodeCost = cost;
			lowestNode = i;		
		}
	}
	return lowestNode;
}

function dijkstra(graph, startingNode, endingNode) {
	console.log(graph)
	var costs = {};
	var parents = {};
	parents[startingNode] = null;
	var unprocessed = jQuery.extend(true, {}, graph);
	if(!graph[startingNode]){
		return "Can not find starting node"
	}
	if(!graph[endingNode]){
		return "Can not find ending node"
	}
	for(i in graph[startingNode]){
		costs[i] = graph[startingNode][i];
		parents[i] = startingNode;
	}
	delete unprocessed[startingNode];
	while(Object.keys(unprocessed).length > 0){
		var node = findLowestCostNode(costs, unprocessed);
		cost = costs[node];
		neighbors = graph[node];
		for(var n in neighbors){
			newCost = cost + neighbors[n];
			if((costs[n] > newCost) || !(n in costs)){ // found smaller cost
				costs[n] = newCost;
				parents[n] = node;
			}
		}
		delete unprocessed[node];	
	}
	tracePath(endingNode, parents, startingNode);
	return "trace displayed above";
}


function tracePath(node, parents, startingNode){
	if(node){
		console.log(node);
		if(node != startingNode){
			console.log("|");
		}		
		tracePath(parents[node], parents, startingNode);
	}
	return
}
