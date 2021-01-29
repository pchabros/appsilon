#' map_card UI Function
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
mod_map_card_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("map_card"))
}

#' map_card Server Function
#'
#' @noRd 
mod_map_card_server <- function(input, output, session, title, .data, map_type) {

  ns <- session$ns
  id <- ns("") %>% str_remove("-$")
  
  output$map_card <- renderUI({
    column(
      width = 6,
      id = id,
      class = "card plot-card",
      fluidRow(
        class = "card-panel",
        div(class = "panel-title", span(title))
      ),
      fluidRow(
        class = "card-body",
        HTML(str_c('<svg id="', id, '-map"></svg>'))
      )
    )
  })
  
  session$onFlushed(function() {
    session$sendCustomMessage(map_type, list(
      id = str_c(id, "-map"), data = toJSON(.data)
    ))}
  )

}
