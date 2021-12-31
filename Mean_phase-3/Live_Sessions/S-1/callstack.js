function product(value1,value2){
    
    return value1*value2;
}
function square(side1){
    return product(side1,side1);
}
function printres(side1){
    debugger
    var res=square(side1);
    console.log(res);
}
printres(4);