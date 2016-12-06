
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

// ---------------Display all the movies------------------------- //

function displayMovies(data) {
  let $container = $("#movies");
  let htmlString = "";

  // let $container = $("#movies");
  $container.empty();

  if (data["Response"] == "False") {
    htmlString = `
    <div class="alert alert-danger text-center" role="alert">${data["Error"]}</div>
    `;
  } else {

    data["Search"].forEach (function(movie) {
      // htmlString = "";
      htmlString += `
      <div class="movie-container">
      <img class="img-responsive center-block" src=${ movie["Poster"] == "N/A" ? "/assets/not-found.png" : movie["Poster"] } data-id=${ movie["imdbID"] } />
      
      <div class="movie-container-details">
      <p class="grid-item-para">
      ${movie["Title"]} <br> ${movie["Year"]}
      </p>
      </div>
      </div>`;
    });
  }

  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector : '.movie-container',
      columnWidth: 200,
      "gutter": 20
    });  
  });
  // $container.append(htmlString);
  $container.masonry()
  .append( htmlString )
  .masonry( 'appended', htmlString )
  .masonry();

  $container.imagesLoaded(function(){
    $container.masonry( 'reloadItems' );
    $container.masonry( 'layout' );
  });

  // masonryInit(container);

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
  <img style="height:200px;" src=${data["Poster"] == "N/A" ? "http://www.reelviews.net/resources/img/default_poster.jpg" : data["Poster"]}  />
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
  function masonryInit (container) {
    let $container = $(container);

    $container.imagesLoaded(function() {
      $container.masonry({
        itemSelector : '.movie-container',
        columnWidth: 200,
        "gutter": 20
      });
    });

    $container.masonry( 'reloadItems' );
    $container.imagesLoaded(function(){
      $container.masonry( 'layout' );
    });
  }

});
