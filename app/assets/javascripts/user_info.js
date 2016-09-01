$(document).ready(function () {

  function toggleView (statusID, userinfoID){
    $(statusID).on("click", function(){
      $(userinfoID).toggleClass("hidden")
    });
  };

  toggleView("#repos", "#user-repos")
  toggleView("#orgs", "#user-orgs")
  toggleView("#commits", "#user-commits")
  toggleView("#friendcommits", "#user-friendcommits")
});
