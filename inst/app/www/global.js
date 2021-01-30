$(document).ready(function() {
  window.global = { render: {} };
  function renderPlots() {
    for (const plot in global.render) {
      global.render[plot]();
    }
  }
  window.onresize = renderPlots;
});
