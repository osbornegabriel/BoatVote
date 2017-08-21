var $boatDisplay;
var $boatView;
var $boatLink;


function nextPicture(){

}


$(document).ready(function() {
  console.log("Thar she blows!");
  $boatDisplay = $(".boat-display");

  $boatDisplay.on("click", "#boat-link", function(event){
    event.preventDefault();
    $boatLink = $(this);
    var url = $boatLink.attr("href");

    $.ajax({
      method: 'GET',
      url: url
    }).done(function(response){
      console.log(response);
      $boatDisplay.html(response);
    })
  })


});
