const {exec} = require ('child_process');
exec('dir',(error,stdout,stderr)=>{
    if(error){
        console.log('error '+error);
    }
    console.log('stdout '+stdout);
    if(stderr){
        console.log('stderr '+stderr);
    }
})