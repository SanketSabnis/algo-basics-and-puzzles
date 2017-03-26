export function knapsack(items, maxWeight) {
  const finalGrid = items.reduce((grid, item, rowIndex) => {
    // fucking reduce doesn't work on Array(n)
    const subProblems = [];
    while(subProblems.length < maxWeight) {
      subProblems.push(subProblems.length + 1);
    }
    return [
      ...grid,
      subProblems.reduce((row, _, colIndex) => {
        // set max weight for this column
        const colMax = colIndex + 1;
        // if we're on the first row we don't need to compare with the previous
        if(rowIndex) {
          const prevBest = grid[rowIndex - 1][colIndex];
          // if current item weighs more than column maxWeight, use value for previous row
          if(item.weight > colMax) {
            return [ ...row, prevBest ];
          }
          const curBest = ((spaceLeft) => {
            if(spaceLeft > 0) {
              const bestFiller = grid[rowIndex - 1][spaceLeft - 1];
              return {
                items: [ ...bestFiller.items, item ],
                value: bestFiller.value + item.value
              };
            }
            return { items: [ item ], value: item.value };
          })(colMax - item.weight);

          return [
            ...row,
            curBest.value > prevBest.value ? curBest : prevBest
          ];
        }
        // if current item weighs more than column maxWeight, don't add value
        return [
          ...row,
          item.weight > colMax ?
            { items: [ ], value: 0 } :
            { items: [ item ], value: item.value }
        ];
      }, [])
    ];
  }, []);
  return finalGrid[items.length - 1][maxWeight - 1];
}

export function longestSubstring() {

}

export function longestSubsequence() {

}
