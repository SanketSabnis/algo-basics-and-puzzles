const binaryHelper = (list, val, low, high) => {
  const mid = (low + high) / 2 | 0;
  const guess = list[mid];
  if(low > high)
    return null;
  if(guess === val) 
    return mid;
  if(guess < val)
    return binaryHelper(list, val, mid + 1, high);
  if(guess > val)
    return binaryHelper(list, val, low, mid - 1);
};

const binary = (list, str) =>
  binaryHelper(list, str, 0, list.length - 1);

export default binary;
