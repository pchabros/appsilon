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
    div(
      class = "card map-card", id = id,
      fluidRow(
        class = "card-panel",
        div(class = "map-title", span(title))
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
