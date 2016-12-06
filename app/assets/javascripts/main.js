
$(function () {

  let form = $('#movie-search');
  form.submit(function(e){
    e.preventDefault();

    $.ajax({
      url: 'http://www.omdbapi.com/?',
      data: form.serialize()
    })
    .done(function(data){
      displayMovies(data);
    });

  });

  function displayMovies(data) {
    container = $("#movies");
    let htmlString = "";
    container.empty();

    if (data["Response"] == "False") {
      htmlString = `
      <div class="alert alert-danger text-center" role="alert">${data["Error"]}</div>
      `;
    } else {

      data["Search"].forEach (function(movie) {
        htmlString += `
        <div class="grid-item--width2">
          <img class="grid-item-img" src=${ movie["Poster"] == "N/A" ? "/assets/not-found.png" : movie["Poster"] } data-id=${ movie["imdbID"] } />
          <p class="grid-item-para">
            ${movie["Title"]} <br> ${movie["Year"]}
          </p>
        </div>`;
      });
    }

    container.append(htmlString);
  }


  $('#movies').on('click', 'img', function(element){
    element.preventDefault();

    let id = $(element.target).data('id');

    $.ajax({
      url: "http://www.omdbapi.com/?",
      data: {i: id}   
    })
    .done(function(data){
      displayMovie(data);
    });

  });

  
  function displayMovie(data){
    let container = $("#movies")
    let htmlString = "";
    container.empty();

    htmlString += `
    <img src=${data["Poster"] == "N/A" ? "http://www.reelviews.net/resources/img/default_poster.jpg" : data["Poster"]}  />
    <p>Title :  ${data["Title"]}</p>
    <p>Year:  ${data["Year"]}</p>
    <p> ${data["Plot"]}</p>                         
    <p>Released : ${data["Released"]}</p>
    <p>Runtime : ${data["Runtime"]}</p>
    <p>Genre : ${data["Genre"]}</p>
    <p>Director : ${data["Director"]}</p>
    <p>Writter : ${data["Writer"]}</p>
    <p>Actors : ${data["Actors"]}</p>
    <p>Language : ${data["Language"]}</p>
    <p>Country : ${data["Country"]}</p>
    <p>Awards : ${data["Awards"]}</p>

    <form id="rating-form" action="/reviews" method="POST">
    <input type="hidden" name="authenticity_token" value=${window._token} />
    <input type="hidden" name="imdbid" value=${data["imdbID"]} />
    <textarea name= "review[comment]" class="form-control" placeholder="Your movie review"/>
    <br />
    <input type="submit" class="btn btn-success pull-right" />
    </form>`;
    
    container.append(htmlString);
  }

  // Masonry init


});
