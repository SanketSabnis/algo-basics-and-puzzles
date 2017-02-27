//! This module implements a basic quicksort. It feels memory inefficient
//! but handing references back and forth started to get pretty complicated

fn partition<T:PartialOrd + Clone>(coll: &[T], pivot: &T) -> (Vec<T>,Vec<T>,Vec<T>) {
    let smaller = coll.to_vec().into_iter().filter(|x| x < pivot).collect::<Vec<T>>();
    let larger = coll.to_vec().into_iter().filter(|x| x > pivot).collect::<Vec<T>>();
    let equal = coll.to_vec().into_iter().filter(|x| x == pivot).collect::<Vec<T>>();
    (smaller, equal, larger)
}

/// The sort function accepts a slice and returns a Vector, and works pretty much
/// like you'd expect a quicksort to work.
/// 
/// #Examples
/// ```
/// use grokking::quicksort::*;
/// let list_of_names = ["chris",
///                      "sanket",
///                      "aaron",
///                      "forest",
///                      "vince",
///                      "qian",
///                      "dave",
///                      "riley",
///                      "tara",
///                      "lee"];
/// assert_eq!(sort(&list_of_names),
/// ["aaron","chris","dave","forest","lee","qian", "riley","sanket","tara","vince"]);

pub fn sort<T:PartialOrd + Clone>(coll: &[T]) -> Vec<T> {
    if coll.len() < 2 {
        coll.to_vec()
    } else {
        let pivot = coll.len() / 2;
        let (smaller, equal, larger) = partition(coll, &coll[pivot]);
        sort(&smaller).into_iter().chain(equal).chain(sort(&larger)).collect()
    }
}

#[cfg(test)]
mod tests {
    use super::sort;

    #[test]
    fn sorts_numbers() {
        let a = vec![7,6,5,4,3,2,1];
        let sorted_a = sort(&a);
        assert_eq!(sorted_a, vec![1,2,3,4,5,6,7]);
    }

    #[test]
    fn sorts_chars() {
        let a = vec!['e', 'd', 'c', 'a', 'b'];
        let sorted_a = sort(&a);
        assert_eq!(sorted_a, vec!['a','b','c','d','e']);
    }

    #[test]
    fn doesnt_mutate_original() {
        let a = vec!['e', 'd', 'c', 'a', 'b'];
        sort(&a);
        assert_eq!(a, vec!['e','d','c','a','b']);
    }
}
