
var alamein = ['Flinders Street','Richmond','East Richmond','Burnley','Hawthorn','Glenferrie'];
var sandringham = ['Southern Cross','Richmond','South Yarra','Prahran','Windsor'];
var glenWaverley =  ['Flagstaff','Melbourne Central','Parliament','Richmond','Kooyong','Tooronga'];
var allLines = [alamein,sandringham,glenWaverley];

var differentLine = function(origin,destination) {
 if( origin === interchange() || destination === interchange() ) {
   return false;
 }
 return (whatLine(origin)).indexOf(destination) === -1 
}

var interchange = function() {
 return 'Richmond';
}

var whatLine = function(station) {
 if( station === interchange() ) {
   return undefined;
 }  

 for (var i = 0;i < allLines.length;i++) {
   var lineLength = allLines[i].length;
   for (var j = 0; j < lineLength; j++ ) {
     if (allLines[i][j] === station) {
        return allLines[i]; 
     }
   }
 }
}

var mapJourney = function(line,origin,destination) {
 var start = line.indexOf(origin);
 var end = line.indexOf(destination);

 if (end > start) {
  return line.slice(start,end+1);
 } 
 return line.slice(end,start+1).reverse();
} 


var origin = 'Glenferrie';
// var origin = 'Richmond';
var destination = 'Flagstaff';

var completeJourney = [];
if (differentLine(origin,destination)) {
 var changeAt = interchange();
 var journey1 = mapJourney(whatLine(origin),origin,changeAt);
 var journey2 = mapJourney(whatLine(destination),changeAt,destination);

 journey1.pop();
 completeJourney = journey1.concat(journey2);
} else {
 
 if( whatLine(origin) === undefined ) {
   completeJourney = mapJourney(whatLine(destination), origin, destination);
 } else {
   completeJourney = mapJourney(whatLine(origin), origin, destination);
 }
}

console.log("------------------------------------");
console.log(" >>>  Welcome to Metro™ <<<");
console.log("Starting at: " + origin);
console.log("   Going to: " + destination);
console.log("------------------------------------");

console.log( completeJourney.join(' --> ') );

console.log("Your journey will go for " + completeJourney.length + " stops")
if( differentLine(origin, destination) ) {
	console.log("You will need to change at " + interchange() + " station");
}


