var $boatDisplay;
var $boatView;
var $boatLink;
var $voteLink;
var previousVoteValue;
var $previousVote;


function depressedVoteLink(){
  previousVoteValue = $(".vote").attr("data-previous_vote");
  $previousVote = $("." + previousVoteValue);
  console.log(previousVoteValue);
  console.log($previousVote);
  $previousVote.addClass('vote-value');
}


$(document).ready(function() {
  console.log("Thar she blows!");
  $boatDisplay = $(".boat-display");

  depressedVoteLink();

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
