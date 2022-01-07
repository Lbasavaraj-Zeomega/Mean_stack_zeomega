var mongo=require("mongodb");
var mongoclient=mongo.MongoClient;
var url="mongodb://localhost:27017/";

mongoclient.connect(url,(err,conn)=>{
    if(err)
        console.log(err);
    else
        console.log("connected");
        var db=conn.db("employeess");
        db.collection('items').find().toArray(function(err,result){
            if(err) throw err;

            console.log(result);
            conn.close();
        })
        
        db.collection('items').find({item:"pen"}).toArray(function(err,result){
            if(err) throw err;
            
            console.log("pen item deatils");
            console.log(result);
            conn.close();
        })
    })