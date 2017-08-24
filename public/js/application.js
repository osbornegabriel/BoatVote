var $boatDisplay;
var $boatView;
var $boatLink;
var $voteLink;
var previousVoteValue;
var $previousVote;

$(document).ready(function() {
  console.log("Thar she blows!");
  $boatDisplay = $(".boat-display");
  depressedVoteLink();
  updateVote();
  nextBoat();
});



function depressedVoteLink(){
  previousVoteValue = $(".vote").attr("data-previous_vote");
  $previousVote = $(".vote").find("." + previousVoteValue);
  $previousVote.removeAttr('href');
  $previousVote.find('button').addClass('vote-value');
}

function nextBoat(){
    $boatDisplay.on("click", "#boat-link", function(event){
    event.preventDefault();
    $boatLink = $(this);
    var url = $boatLink.attr("href");

    $.ajax({
      method: 'GET',
      url: url
    }).done(function(response){
      $boatDisplay.html(response);
      depressedVoteLink();
    })
  })
}

function updateVoteDisplay(boatLink){
  var boatId = boatLink.match(/\d+/);
  var boteValue = boatLink.match(/\w+$/);
  var boatLink = "/boats/" + boatId + "/boatvotes/" + boteValue + "/edit";
  $.ajax({
    url: boatLink
  }).done(function(response){
    $('.vote').html(response);
  })
}

function updateVote(){
  $(".boat-display").on("click", ".vote a", function(event){
    event.preventDefault();
    var voteUrl = $(this).attr("href");

    $.ajax({
      url: voteUrl
    }).done(function(response){
      $('.vote').attr("data-previous_vote", response);
      updateVoteDisplay(voteUrl);
    })
  })
}


