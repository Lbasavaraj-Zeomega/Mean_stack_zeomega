var readline = require('readline-sync');
console.log("index.js is running");

const fs = require('fs');
const _ = require('lodash');
//const yargs = require('yargs');

const tasks = require('./todo')
var read=false;
do {
  console.log("-----------------------------------------");
  console.log("1. AddTodo");
  console.log("2. DeleteToDo");1
  console.log("3. ListToDo");
  var value = parseInt(readline.question("Select  choice to Do task: "));
  switch (value) {
    case 1:
      console.log("-----------------------------------------");
      var input=readline.question("Enter the task: ")
    console.log('Entered Task is :', input);
      tasks.addTodo(input);
      console.log("ToDo adeddd successfully!!!")

      break;
    case 2:
      console.log("-----------------------------------------");
      var input=readline.question("Enter the task to delete: ")
      var todoDeleted = tasks.deleteTodo(input);
      var message = todoDeleted ?
        'Todo was deleted' : 'Todo can not found';
      console.log(message);
      console.log("ToDo Deleted successfully!!")
      break;
    case 3:
      console.log("-----------------------------------------");
      var allTodos = tasks.listTodos();
      console.log(`${allTodos.length} tasks available`);
      allTodos.forEach((todo) => tasks.logTodo(todo));
      break;
    default:
      console.log('It is a Invalid command.');
  }
 var inp=readline.question("Do you want to continue pres 'y' for exit press any key: ");
  if(inp === "y"){
    read=true;
  }else{
    read=false;
    console.log("Thank you!!");
  }
}while(read)