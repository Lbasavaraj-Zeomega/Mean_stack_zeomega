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
      <style>
      .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid rgba(0,0,0,.125);
        border-radius: .25rem;
    }
    
    .card-body {
      background-color:black;
      color:white;
        flex: 1 1 auto;
        padding: 1.25rem;
    }
    
    .card-title {
        margin-bottom: .75rem;
    }
    
    .card-img-top {
        width: 100%;
        border-top-left-radius: calc(.25rem - 1px);
        border-top-right-radius: calc(.25rem - 1px);
    }
    
    .text-left {
        text-align: left!important;
    }
    .pb-2, .py-2 {
        padding-bottom: .5rem!important;
    }
    .pt-2, .py-2 {
        padding-top: .5rem!important;
    }
    </style>
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
  