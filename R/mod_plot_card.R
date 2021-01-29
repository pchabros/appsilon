#' plot_card UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS
#' @importFrom stringr str_remove str_c
#' @importFrom jsonlite toJSON
mod_plot_card_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("plot_card"))
}

#' plot_card Server Function
#'
#' @noRd 
mod_plot_card_server <- function(input, output, session, title, .data, plot_type) {

  ns <- session$ns
  id <- ns("") %>% str_remove("-$")
  
  output$plot_card <- renderUI({
    column(
      width = 6,
      id = id,
      class = "card plot-card",
      fluidRow(
        class = "card-panel",
        column(width = 6, class = "panel-title", span(title)),
        div(
          class = "card-tools float-right",
          map(
            c("remove", "expand", "minimize"),
            ~button(ns(.x), .x)
          )
        )
      ),
      fluidRow(
        class = "card-body",
        HTML(str_c('<svg id="', id, '-plot"></svg>'))
      )
    )
  })
  
  session$onFlushed(function() {
    session$sendCustomMessage(plot_type, list(
      id = str_c(id, "-plot"), data = toJSON(.data)
    ))}
  )
  
  observeEvent(input$remove, {
    session$sendCustomMessage("remove", id)
  })  

  observeEvent(input$expand, {
    session$sendCustomMessage("expand_toogle", id)
  })  

  observeEvent(input$minimize, {
    session$sendCustomMessage("minimize_toogle", id)
  })  

}
