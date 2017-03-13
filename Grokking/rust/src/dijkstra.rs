use std::collections::{ HashSet, HashMap };

pub fn dijkstra(start: &str, finish: &str, graph: HashMap<&str, HashMap<&str, u32>>) -> u32 {
    let mut parents = HashMap::new();
    let mut distance = HashMap::new();
    let mut scanned = HashSet::new();

    for (&node, &dist) in graph.get(start).unwrap() {
        parents.insert(node, start);
        distance.insert(node, dist);
        scanned.insert(start);
    }

    while !scanned.contains(finish) {
        let (node, dist) = distance
            .iter()
            .fold(("", u32::max_value()),
                | (low_node, low_dist), (node, &dist) | {
                    if dist < low_dist && !scanned.contains(node) {
                        (node, dist)
                    } else {
                        (low_node, low_dist)
                    }
            });
        for (neighbor, dist) in graph.get(node).unwrap() {
            let cost = distance.get(node).unwrap() + dist;
            let old_cost = match distance.get(neighbor) {
                Some(&x) => x,
                None => u32::max_value()
            };
            if cost < old_cost {
                distance.insert(neighbor, cost);
                parents.insert(neighbor, node);
            }
        }
        scanned.insert(node);
    }

    *distance.get(finish).unwrap()
}

#[cfg(test)]
mod tests {
    use super::dijkstra;
    use std::collections::HashMap;

    #[test]
    pub fn dijkstra_works() {
        let mut graph = HashMap::new();
        let mut piano = HashMap::new();
        let mut guitar = HashMap::new();
        guitar.insert("piano", 20);
        let mut drums = HashMap::new();
        drums.insert("piano", 10);
        let mut poster = HashMap::new();
        poster.insert("guitar", 30);
        poster.insert("drums", 35);
        let mut lp = HashMap::new();
        lp.insert("guitar", 15);
        lp.insert("drums", 20);
        let mut book = HashMap::new();
        book.insert("lp", 5);
        book.insert("poster", 0);
        graph.insert("piano", piano);
        graph.insert("lp", lp);
        graph.insert("guitar", guitar);
        graph.insert("drums", drums);
        graph.insert("poster", poster);
        graph.insert("book", book);

        let distance = dijkstra("book", "piano", graph);
        assert_eq!(distance, 35);
    }
}
