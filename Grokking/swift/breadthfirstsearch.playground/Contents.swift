import Cocoa // Needed for String.range method

func bfs(_ graph: [String: Array<String>], _ start: String, _ test: (String) -> Bool) -> Int? {
    var queue = [start]
    var distance = 0
    var nodesChecked: [String: Bool] = [:]
    repeat {
        var newQueue: Array<String> = []
        for item in queue {
            if (nodesChecked[item] == true) {
                continue
            }
            if (test(item)) {
                return distance
            }
            nodesChecked[item] = true
            if (graph[item] != nil) {
                newQueue += graph[item]!
            }
        }
        queue = newQueue
        distance += 1
    } while (queue.count > 0)
    return nil
}

// Test graph and matching functions

var family: [String: Array<String>] = [:]
let Gibbs = ["Richard","Linda","Keegan","Riley","Katelin"]
let Beverson = ["Charlie","Pat","Christine","Danielle"]
let Douglas = ["Chuck","Christine","Madison","Kennedy"]
let Bakken = ["Larry","Diane","Linda","John","Paul","Julie"]
let Devoe = ["Rick","Julie","Ryder","Fisher","Jaysea"]
let Bakken2 = ["John","Marie"]
family["Riley"] = Gibbs + ["Danielle"]
family["Keegan"] = Gibbs + ["Tanya"]
family["Katelin"] = Gibbs + ["Ryland"]
family["Danielle"] = Beverson + ["Riley"]
family["Tanya"] = ["Keegan"]
family["Ryland"] = ["Katelin"]
family["Christine"] = Douglas + Beverson
family["Chuck"] = Douglas
family["Madison"] = Douglas
family["Kennedy"] = Douglas
family["Linda"] = Gibbs + Bakken
family["Richard"] = Gibbs
family["John"] = Bakken + Bakken2
family["Marie"] = Bakken2
family["Paul"] = Bakken
family["Julie"] = Bakken + Devoe
family["Rick"] = Devoe
family["Ryder"] = Devoe
family["Fisher"] = Devoe
family["Jaysea"] = Devoe
family["Larry"] = Bakken
family["Diane"] = Bakken

func matchName(_ nameToMatch: String) -> (String) -> Bool {
    func matcher(_ checkedName: String) -> Bool {
        return checkedName == nameToMatch
    }
    return matcher
}

func nameHas(_ searchString: String) -> (String) -> Bool {
    func matcher(_ checkedName: String) -> Bool {
        let range = checkedName.lowercased().range(of: searchString.lowercased())
        if (range != nil) {
            return true
        } else {
            return false
        }
    }
    return matcher
}

bfs(family, "Ryder", matchName("Madison"))
bfs(family, "Riley", nameHas("oh"))