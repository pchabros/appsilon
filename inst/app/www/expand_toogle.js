$(document).ready(function() {
  Shiny.addCustomMessageHandler("expand_toogle", function(id) {
    const plotDiv = $(`#${id}`);
    const plotsCol = $("#plots-col");
    const expanded = plotsCol.hasClass("col-sm-12");
    const areaWidth = $("#plots-area").innerWidth();
    let plotWidth;
    if (expanded) {
      plotsCol.addClass("col-sm-6").removeClass("col-sm-12");
      plotWidth = areaWidth / 2;
    } else {
      plotsCol.addClass("col-sm-12").removeClass("col-sm-6");
      plotWidth = areaWidth;
    }
    const plotHeight = plotWidth * 0.5;
    plotDiv.attr("height", plotHeight);
    const plotId = `${id}-plot`;
    global.render[plotId](plotId, plotWidth);
  });
});
