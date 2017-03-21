//: Playground - noun: a place where people can play

import Cocoa

let states_needed: Set = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]
let stations: [String: Set<String>] = [
    "kone": ["id", "nv", "ut"],
    "ktwo": ["wa", "id", "mt"],
    "kthree": ["or", "nt", "ca"],
    "kfour": ["nv", "ut"],
    "kfive": ["ca", "az"]
]

func greedyStations(_ states_needed: Set<String>,
                    _ stations: [String: Set<String>]) -> Set<String> {
    var stations_added: Set<String> = []
    var best_station = ""
    var covered_states: Set<String> = []
    while (true) {
        let candidate_stations = Set(stations.keys).subtracting(stations_added)
        best_station = ""
        var best_station_value = 0
        for candidate in candidate_stations {
            let candidate_value = stations[candidate]!.intersection(states_needed)
                .subtracting(covered_states).count
            if (candidate_value > best_station_value) {
                best_station = candidate
                best_station_value = candidate_value
            }
        }
        if let new_states_covered = stations[best_station] {
            covered_states.formUnion(new_states_covered)
            stations_added.insert(best_station)
        } else {
            break
        }
    }
    return stations_added
}

greedyStations(states_needed, stations)