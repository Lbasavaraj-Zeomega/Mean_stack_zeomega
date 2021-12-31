function test1(){
    console.log("1");
    setTimeout(()=>{
        console.log("1");
    },2000)
    
    }
function test2(){
        console.log("2");
        setTimeout(()=>{
            console.log("2");
        },1000)
        
        }


        test1();
        test2();