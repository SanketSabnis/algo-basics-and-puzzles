extern crate grokking;

use std::collections::HashMap;
use grokking::bfs::search;

fn main() {
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
    println!("{}: {}", name, depth);
}
