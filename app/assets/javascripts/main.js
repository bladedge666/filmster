$(function(){
  $.ajax({
    url: 'http://www.omdbapi.com/?',
    data: {"s": "superman"}
  })
  .done(function(data){
    displayMovies(data);
  });

  function displayMovies(data){
    let htmlString = "";
    
    movies = data["Search"]; 

    movies.forEach (function (movie) {
      htmlString += `
      <img src=${movie["Poster"]}/>
      <p>${movie["Title"]}</p>
      <p>${movie["Year"]}</p>
      `;
    });

    $("#movies").append(htmlString);
  }
});
