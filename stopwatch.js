var time = 1 * 30 * 1000

function removeTime(){
    time = time - 1000;
    if(time <= 0){
       clearInterval(id);
    }
    process.stdout.write( "------     " + time/1000 + '\r');
}

var id = setInterval(removeTime, 1000);

