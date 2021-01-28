$(document).ready(function() {
  Shiny.addCustomMessageHandler("expand_toogle", function(id) {
    $(`#${id}`).toggleClass("col-sm-12").toggleClass("col-sm-6");
  });
});
