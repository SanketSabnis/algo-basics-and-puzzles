pub fn lcss(one: &str, two: &str) -> u32 {
    let mut grid = vec![vec![0; two.len()]; one.len()];
    let mut lcss = 0;

    for (one_i, one_c) in one.char_indices() {
        for (two_i, two_c) in two.char_indices() {
            if one_c == two_c {
                let dec_one = get_safe_index(one_i);
                let dec_two = get_safe_index(two_i);
                let val: u32 = grid[dec_one][dec_two];
                grid[one_i][two_i] = val + 1;
                if val + 1 > lcss {
                    lcss = val + 1;
                }
            } else {
                let above = grid[get_safe_index(one_i)][two_i];
                let behind = grid[one_i][get_safe_index(two_i)];
                if above > behind {
                    grid[one_i][two_i] = above;
                } else {
                    grid[one_i][two_i] = behind;
                }
            }
        }
    }

    lcss
}

fn get_safe_index(x: usize) -> usize {
    if x == 0 {
        0
    } else {
        x - 1
    }
}

#[cfg(test)]
mod tests {
    use super::lcss;

    #[test]
    pub fn test_lcss() {
        assert_eq!(lcss("blues", "clue"), 3);
        assert_eq!(lcss("abcdefghi", "bcefia"), 5);
    }
}
