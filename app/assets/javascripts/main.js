
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
        <img src=${ movie["Poster"] == "N/A" ? "/assets/not-found.png" : movie["Poster"] } data-id=${ movie["imdbID"] } />
        <p>${movie["Title"]}</p>
        <p>${movie["Year"]}</p>`;
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

  function displayMovie(data) {
    container = $("#movies");
    let htmlString = "";
    container.empty();

    if (data["Response"] == "False") {
      htmlString = `
      <div class="alert alert-danger text-center" role="alert">${data["Error"]}</div>
      `;
    } else {

      htmlString += `<img src=${ data["Poster"] == "N/A" ? "/assets/not-found.png" : data["Poster"] } alt="${data["Title"]}" />`;
      let count = 0;
      for (let k in data) {
        if (k == "imdbID") continue;
        console.log(k);
        if (count++ >= 12) break;
        htmlString += `<p>${ k + ": " + data[k]}</p>`;
      }

    }

    container.append(htmlString);
  }

});
