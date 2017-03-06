use std::collections::{ HashMap, VecDeque, HashSet };

pub fn search<'a>(you: &'a str, graph: HashMap<&'a str, Vec<&'a str>>)
    -> Option<(&'a str, u32)> {
    let mut depth = 1;
    let mut q = VecDeque::new();
    let mut depth_map = HashMap::new();
    for &friend in &graph[you] {
        q.push_back(friend);
        let d = depth_map.entry(depth).or_insert(HashSet::new());
        d.insert(friend);
    }
    loop {
        let friend = q.pop_front();
        match friend {
            Some(f) if is_mango_seller(f) => return Some((f, depth)),
            Some(f) if graph.contains_key(f) => {
                for &friend in &graph[f] {
                    q.push_back(friend);
                    let d = depth_map.entry(depth + 1).or_insert(HashSet::new());
                    d.insert(friend);
                }
                remove_from_map(&mut depth_map, &depth, f);
            },
            Some(f) => { 
                remove_from_map(&mut depth_map, &depth, f);
            },
            None => break
        }
        if depth_map.entry(depth).or_insert(HashSet::new()).is_empty() {
            depth += 1;
        }
    }
    None
}

fn remove_from_map(map: &mut HashMap<u32, HashSet<&str>>, depth: &u32, name: &str) {
    let d = map.get_mut(depth);
    match d {
        Some(set) => { set.remove(name); },
        None => { }
    }
}

fn is_mango_seller(friend: &str) -> bool {
    friend.starts_with("M")
}

#[cfg(test)]
mod tests {
    use super::search;
    use std::collections::HashMap;

    #[test]
    fn check_bfs() {
        let mut graph = HashMap::new();
        graph.insert("Chris", vec!["Dave", "Forest"]);
        graph.insert("Forest", vec!["Qian", "Vince", "Dan"]);
        graph.insert("Dave", vec!["Riley", "Lee", "Aaron"]);
        graph.insert("Qian", vec!["Tara", "Kim", "Sanket", "Jeff"]);
        graph.insert("Sanket", vec!["Spencer", "Maeve"]);
        let (name, depth) = match search("Chris", graph) {
            Some((name, depth)) => (name, depth),
            None => ("", 0)
        };
        assert_eq!((name, depth), ("Maeve", 4));
    }
}
