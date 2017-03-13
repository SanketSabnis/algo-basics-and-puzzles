import Cocoa

func dijkstra (_ map: [String: [String: Int]],
               _ start: String, _ goal: String)
    -> (distance: Int, path: Array<String>)? {
        if start == goal {
            return (0, [start])
        }
        if (map.keys.contains(start) == false
            || map.keys.contains(goal) == false) {
            return nil
        }
        var paths: [String: (distance: Int, parent: String)] = [:]
        var checkedNodes: Array<String> = []
        var nextNode = start
        repeat {
            paths = updatePaths(paths, map, nextNode)
            checkedNodes.append(nextNode)
            nextNode = getCheapestNode(paths, checkedNodes)
        } while nextNode != goal && nextNode != ""
        if nextNode == "" {
            return nil
        }
        var shortestPath = [goal]
        repeat {
            let firstInPath = shortestPath.last!
            let parent = paths[firstInPath]!.parent
            shortestPath.append(parent)
        } while shortestPath.contains(start) == false
        shortestPath.reverse()
        return (paths[nextNode]!.distance, shortestPath)
}

func getCheapestNode (_ paths: [String: (distance: Int, parent: String)],
                      _ checkedNodes: Array<String>) -> String {
    var cheapestNode = ""
    for (nodeName, path) in paths {
        if checkedNodes.contains(nodeName) {
            continue
        }
        if let cheapestNodePath = paths[cheapestNode] {
            if path.distance < cheapestNodePath.distance {
                cheapestNode = nodeName
            }
        } else {
            cheapestNode = nodeName
        }
    }
    return cheapestNode
}

func updatePaths (_ paths: [String: (distance: Int, parent: String)],
                  _ map: [String: [String: Int]],
                  _ currentNode: String) -> [String: (distance: Int, parent: String)] {
    let pathDistance: Int
    if let pathNode = paths[currentNode] {
        pathDistance = pathNode.distance
    } else {
        pathDistance = 0
    }
    var newPaths: [String: (distance: Int, parent: String)] = [:]
    for (nextNode, mapDistance) in map[currentNode]! {
        if let pathToNextNode = paths[nextNode] {
            if pathToNextNode.distance > mapDistance + pathDistance {
                newPaths[nextNode] = (distance: mapDistance + pathDistance,
                                      parent: currentNode)
            } else {
                newPaths[nextNode] = paths[nextNode]
            }
        } else {
            newPaths[nextNode] = (distance: mapDistance + pathDistance,
                                  parent: currentNode)
        }
    }
    for (k,v) in paths {
        if newPaths.keys.contains(k) == false {
            newPaths[k] = v
        }
    }
    return newPaths
}

// Trading for a piano test case from page 122

var map: [String: [String: Int]] = [:]
map["book"] = ["lp": 5, "poster": 0]
map["poster"] = ["guitar":30, "drums": 35]
map["lp"] = ["guitar": 15, "drums": 20]
map["guitar"] = ["piano": 20]
map["drums"] = ["piano": 10]
map["piano"] = [:]

if let result = dijkstra(map, "book", "piano") {
    result.distance // Should be 35
    result.path // Should be book > lp > drums > piano
}

dijkstra(map, "foo", "bar")
dijkstra(map, "piano", "guitar")
dijkstra(map, "guitar", "piano")
