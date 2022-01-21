let products: { name: string; price: number; }[] = [];

let size = 0;
var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
  });
  
function addDigital(){
    let item = {name:'Playstation 5 Digital', price:399}
    products.push(item);
    localStorage.setItem("items", JSON.stringify(products));
    updateCart();
}

function addDisc(){
    let item = {name:'Playstation 5 Disc', price:499}
    products.push(item);
    localStorage.setItem("items", JSON.stringify(products));
    updateCart();
}

function addSeriesS(){
    let item = {name:'XBOX Series S', price:300}
    products.push(item);
    localStorage.setItem("items", JSON.stringify(products));
    updateCart();   
}

function addSeriesX(){
    let item = {name:'XBOX Series X', price:500}
    products.push(item);
    localStorage.setItem("items", JSON.stringify(products));
    updateCart();
}


function updateCart(){
    let size = JSON.parse(localStorage.getItem("items")).length;
    let size_DOM = document.getElementById("size")
    size_DOM.innerText = `${size}`;
}


function display(){
    let sum:number = 0;

    let rows = JSON.parse(localStorage.getItem("items"));    
    let table = document.getElementById("table_display");

    for(let i = 0; i < rows.length; i++){
    let row = table.insertRow();
    let cell1 = row.insertCell(0);
    let cell2 = row.insertCell(1);

    cell1.innerHTML= rows[i].name;
    cell2.innerHTML= formatter.format(rows[i].price);
    sum+=rows[i].price;
    }

    let display = document.getElementById('total')
    display.innerText = `Total Price: ${formatter.format(sum)}`;
}