//! Selection sort is a simple quadratic sorting algorithm

/// The sort function accepts a vector and returns the sorted
/// equivalent!
///
/// #Example
/// ```
/// use grokking::selection_sort::*;
///
/// let a = vec![1,5,2,8,6,10,3];
/// let sorted_a = sort(&a);
/// assert_eq!(sorted_a, [1,2,3,5,6,8,10]);
/// ```

pub fn sort<T: PartialOrd + Clone>(collection: &Vec<T>) -> Vec<T> {
    let mut sorted = Vec::new();
    let mut original = collection.clone();
    while original.len() > 0 {
        let smallest_index = find_smallest(&original);
        sorted.push(original.swap_remove(smallest_index));
    }
    sorted
}

fn find_smallest<T: PartialOrd>(collection: &Vec<T>) -> usize {
   collection
       .iter()
       .enumerate()
       .fold(0, |smallest, (index, element)| if &collection[smallest] < element { smallest } else { index })
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
