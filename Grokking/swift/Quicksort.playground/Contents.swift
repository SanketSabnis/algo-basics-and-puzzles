func quicksort<T: Comparable>(_ coll: Array<T>) -> Array<T> {
    // Base case
    if (coll.count < 2) { return coll }
    // Recursive case
    let pivotSpot = coll.count / 2;
    let pivot = coll[pivotSpot];
    let trimmedColl = coll.prefix(upTo: pivotSpot)
        + coll.suffix(from: pivotSpot+1);
    let left = trimmedColl.filter({$0 < pivot});
    let right = trimmedColl.filter({$0 >= pivot});
    let pivotArray = [pivot];
    return quicksort(left) + pivotArray + quicksort(right);
}

var myArray = [1,2,3,4,3,2,4,3,5,4,5,6];
quicksort(myArray);
