func quicksort<T: Comparable>(_ coll: Array<T>) -> Array<T> {
    if (coll.count < 2) {
        return coll;
    }
    let pivotSpot = coll.count / 2;
    let pivot = coll[pivotSpot];
    var left = Array<T>();
    var right = Array<T>();
    for index in 0...coll.count-1 {
        if (coll[index] < pivot) {
            left.append(coll[index]);
        } else if (index != pivotSpot) {
            right.append(coll[index]);
        }
    }
    let pivotArray = [pivot];
    return quicksort(left) + pivotArray + quicksort(right);
}