function saveData() {

  let article_name, author_name, description;
  article_name = document.getElementById("article_name").value;
  author_name = document.getElementById("author_name").value;

  description = document.getElementById("description").value;

  let user_records = new Array();
  user_records = JSON.parse(localStorage.getItem("users")) ? JSON.parse(localStorage.getItem("users")) : []
  user_records.push
    ({
      "article_name": article_name,
      "author_name": author_name,
      "description": description
    })
  localStorage.setItem("users", JSON.stringify(user_records));
  alert("Saved Successfully");
  window.location.assign('index.html')
}

function showData() {
  //localStorage.clear();
  const container = document.getElementById('showUsers');
  let user_records = new Array();
  user_records = JSON.parse(localStorage.getItem("users")) ? JSON.parse(localStorage.getItem("users")) : []
  if (user_records) {
    

    user_records.forEach((result) => {
      // Create card element
      // let card = document.createElement('div');
      // card.classList = 'card-body';

      // Construct card content
      const content = `
      <div class="col-md-4 col-sm-4 shadow p-3 mb-5 bg-white rounded ">
      <div class="card bg-danger text-black cl-4">
      <div class="card-body text-center" >
          <h4 class="card-title">Article Name: ${result.article_name}</h4>
          <p class="card-text"> Author Name: ${result.author_name}</p>
          <p class="card-text">Description: ${result.description}</p>
       </div>
       </div>
       </div    
       
  `;
  container.innerHTML += content;
    })
   
  }
}
  