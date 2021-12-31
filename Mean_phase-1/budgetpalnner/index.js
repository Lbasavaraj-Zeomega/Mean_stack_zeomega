product_name =new Array();
price=new Array();

    
    var a= document.getElementById("pname");
    var b= document.getElementById("price");
    
    var messageBox  = document.getElementById("display");
    
    function addDetails(){
        product_name.push(a.value);
        price.push(parseInt(b.value));
        alert("Data adedd Susessfully.....");
        alert("Do you want to Comtinue ADD Else Exit");
        clearAndShow()
        
    }
    function clearAndShow () {
        // Clear our fields
     a.value = "";
     b.value = "";
        
    }
    function checkDetails(){
        var sum=0;
    for(var i=0;i<price.length;i++){
            sum=sum+price[i];
    }
    display(sum);
    }
    function display(sum) {
        messageBox.innerHTML = "";
        var html = "<table border='1|1'>";
        html+="<tr>";
        html+="<th> ProductName</th>";
        html+="<th> Price</th>";
        html+="</tr>";
        for (var i = 0; i < price.length; i++) {
            html+="<tr>";
            html+="<td>"+product_name[i]+"</td>";
            html+="<td>"+price[i]+"</td>";
            html+="</tr>";
            
        
        }
        html+="<td>Total Budget:</td> ";
        html+="<td>"+sum+"</td>";
        html+="</table>";
        document.getElementById("display").innerHTML = html;
 };

function asd(a)
{
    if(a==1)
        document.getElementById("asd").style.display="none";
    else
        document.getElementById("asd").style.display="block";
}
