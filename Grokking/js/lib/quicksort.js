const quicksort = (list) => {
  if(list.length < 2) return list;
  const pivot = list.length / 2 | 0;
  const [ left, right ] = list.reduce(
    ([ left, right ], cur, index) => {
      if(index === pivot) return [ left, right ];
      if(cur < list[pivot]) return [ [ ...left, cur ], right ];
      return [ left, [ ...right, cur ] ];
    },
    [ [], [] ]
  );
  return [ ...(quicksort(left)), list[pivot], ...(quicksort(right)) ];
}

export default quicksort;
