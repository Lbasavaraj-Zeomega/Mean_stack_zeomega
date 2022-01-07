const express = require('express')
const app = express()
const http = require('http').createServer(app)
const PORT = process.env.PORT || 3000
const mongo =require('mongodb').MongoClient;
const client=require('socket.io')(4000).sockets;


//conection to mongodb
mongo.connect('mongodb://127.0.0.1/mongochat',function(err,db){
    if(err){
        throw err;
    }
    console.log('Mongodb Connected....');

    //connect to socketio
    client.on('connection',function(socket){
       let chat=db.collection('chats');
       //create function to send status 
       sendStatus =function(s){
           socket.emit('status',s);
       }

       //get chats from mongo collections
       chat.find().limit(100).sort({_id:1}).toArray(function(err,res){
           if(err){
               throw err;
           }
           //emit the messages
           socket.emit('output',res);
       });
       //handle input events
       socket.on('input',function(data){
            let name=data.name;
            let message =data.message;
            //check for name and message
            if(name==''|| message==''){
                //send error status 
                sendStatus('please enter a name and message');
            }else{
                //insert message 
                chat.insert({name:name,message:message},function(){
                    client.emit('output',[data]);

                    //send status object
                    sendStatus({
                        message:"message sent",
                        clear:true
                    });
                });
            }
       });
       //handle clear
       socket.on('clear',function(data){
           //remove all chats from colection
           char.remove({},function(){
               //emit cleared
               socket.emit('cleared');

           })
       })
    });
});
http.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`)
})

app.use(express.static(__dirname + '/public'))

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html')
})

// Socket 
const io = require('socket.io')(http)

io.on('connection', (socket) => {
    console.log('Connected...')
    socket.on('message', (msg) => {
        socket.broadcast.emit('message', msg)
    })

})