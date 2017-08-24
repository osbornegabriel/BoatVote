var $boatDisplay;
var $boatView;
var $boatLink;
var $voteLink;
var previousVoteValue;
var $previousVote;

function depressedVoteLink(){
  previousVoteValue = $(".vote").attr("data-previous_vote");
  $previousVote = $(".vote").find("." + previousVoteValue);
  // console.log(previousVoteValue);
  console.log($previousVote);
  $previousVote.removeAttr('href');
  $previousVote.find('button').addClass('vote-value');
}

function updateVoteDisplay(boatLink){
  var boatId = boatLink.match(/\d+/);
  var boteValue = boatLink.match(/\w+$/);
  console.log(boatId[0]);
  var boatLink = "/boats/" + boatId + "/boatvotes/" + boteValue + "/edit";
  console.log(boatLink);
  $.ajax({
    url: boatLink
  }).done(function(response){
    console.log(response);
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

$(document).ready(function() {
  console.log("Thar she blows!");
  $boatDisplay = $(".boat-display");

  depressedVoteLink();
  updateVote();

  $boatDisplay.on("click", "#boat-link", function(event){
    event.preventDefault();
    $boatLink = $(this);
    var url = $boatLink.attr("href");

    $.ajax({
      method: 'GET',
      url: url
    }).done(function(response){
      // console.log(response);
      $boatDisplay.html(response);
      depressedVoteLink();
    })
  })

});
