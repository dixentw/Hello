var _ = require('underscore');

var data = [4, 5, 1, 43, 54, 323, 32, 11, 8];

function qsort(data){
	if(data.length == 0){
		return [];
	}else if(data.lenth == 1){
		return data;
	}else{
		var pivot = data.pop();
		var less = _.filter(data, function(num){return num < pivot;});
		var larger = _.filter(data, function(num){return num >= pivot;});
		return [].concat(qsort(less))
				 .concat(pivot)
				 .concat(qsort(larger));
	}
}
console.log(data);
var output = qsort(data);
console.log(output);