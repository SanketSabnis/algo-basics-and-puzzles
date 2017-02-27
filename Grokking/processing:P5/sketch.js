var array = [2, 192, 4, 6, 46, 100, 43, 2];
var arrayBinary = [2, 3, 5, 6, 9, 12, 57];

function setup() {
	print("recursion sum " + sum(4));
	console.log("tail_recursion sum " + tail_sum(4, 0));
	print(d_c_sum(array));
	print("count length " + d_c_count(array, 0));
	print("find max " + find_max(array, array[0]));
	// print("binary search value index " + binary([1], -1));
	print("test case: [2, 3, 5, 6, 9, 12, 57], 3", "result: ", binary([2, 3, 5, 6, 9, 12, 57], 3));
	print("test case: [], 1", "result: ", binary([], 1));
	print("test case: [1], 3", "result: ", binary([1], 3));
	print("test case: [-1, 1], 1", "result: ", binary([-1, 1], 1));
	var a = quicksort(array)
	print(a);
}

//3
function sum(i) {
	if(i == 0){
		return 0;
	}else{
		return i + sum(i-1);
	}
}
//3 tail recursion
function tail_sum(i, currentSum) {
	if(i == 0){
		return currentSum;
	}else{
		return tail_sum(i-1, i + currentSum);
	}
}


//4.1
function d_c_sum(arr) {
	if(!arr.length){
		return 0;
	}else{
		return arr[0] + d_c_sum(subset(arr, 1, arr.length-1));
	}
}
//4.2
function d_c_count(arr, currentCount) {
	if(!arr.length){
		return currentCount;
	}else{
		return 1 + d_c_count(subset(arr, 1, arr.length-1), currentCount);
	}
}

//4.3
function compareMax(a, b){
	if(a > b){
		return a;
	}else{
		return b;
	}
}

function find_max(arr, currentMax) {
	if(!arr.length){
		return currentMax;
	}else{
		return find_max(subset(arr, 1, arr.length-1), compareMax(arr[0], currentMax));
	}
}

//4.4
function binary(arr, target) {
	var midIdx = floor(arr.length/2);
	var midValue = arr[midIdx];
	var arr_left = subset(arr, 0, midIdx);
	var arr_right = subset(arr, midIdx, arr.length - midIdx);
 	if((midValue < target) && (arr.length > 1)){
 		var result = binary(arr_right, target);
 		if(result == -1){
 			return result;
 		}else{
 			return midIdx + binary(arr_right, target);
 		}
	}else if((midValue > target) && (arr.length > 1)){
		return binary(arr_left, target);
	}else if((midValue == target) && (arr.length > 1)){
		return midIdx;
	}else{
		return -1;
	}
}

// 4
function quicksort(arr) {
	var arr_left = [];
	var arr_right = [];
	if(arr.length < 2){
		return arr;
	}else{
		for(var i = 1; i < arr.length; i++){
			if(arr[i] < arr[0]){
				append(arr_left, arr[i]);
			}else{
				append(arr_right, arr[i]);
			}
		}
		var arr_temp = concat(quicksort(arr_left), arr[0]);
		return  concat(arr_temp, quicksort(arr_right));
	}
}
