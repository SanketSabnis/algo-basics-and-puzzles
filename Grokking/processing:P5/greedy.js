

function setup() {
	var station = new Set();
	station["one"] = new Set(["id", "nv", "ut"]);
	station["two"] = new Set(["wa", "id", "mt"]);
	station["three"] = new Set(["or", "nv", "ca"]);
	station["four"] = new Set(["nv", "ut"]);
	station["five"] = new Set(["ca", "az"]);
	console.log(stationCoverage(station));
}		


function stationCoverage(stationSets) {
	finalStations = [];
	coverage = new Set();
	for(var i in stationSets){
		coverage = setUnion(coverage, stationSets[i]);
	}
	stationCovered = new Set();
	stationNeeded = coverage;
	while (stationNeeded.size > 0) {
		var bestOption = new Set();
		var covered = new Set();
		var stationSelected = new Set();
		for(var i in stationSets) {
			covered = setIntersection(stationSets[i], stationNeeded);
			if(bestOption.size < covered.size){
				bestOption = covered;
				stationSelected = i;
			}
		}
		finalStations.push(stationSelected);
		stationNeeded = setDiff(stationNeeded, stationSets[stationSelected]);
	}
	return finalStations;
}

function setIntersection(setA, setB) {
	var c = new Set();
	for(let i of setA){
		if(setB.has(i)){
			c.add(i);
		}
	}
	return c;
}

//use the first set as minuend
function setDiff(setA, setB){ 
	let c = new Set(setA); //so we don't mutate setA
	for(let i of setB){
		c.delete(i);
	}
	return c;
}


function setUnion(setA, setB){
	let c = new Set(setA);
	for(let i of setB){
		c.add(i);
	}
	return c;
}