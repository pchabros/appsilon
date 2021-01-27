#' info_cards UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS
#' @importFrom shinymaterial material_row material_column
#' @importFrom stringr str_c
#' @importFrom purrr map
#' @importFrom dplyr %>% slice
#' @importFrom magrittr %$%
mod_info_cards_ui <- function(id) {
  ns <- NS(id)
  material_row(uiOutput(ns("info_cards")))
}

#' info_cards Server Function
#'
#' @noRd 
mod_info_cards_server <- function(input, output, session, .data) {
  ns <- session$ns
  
  output$info_cards <- renderUI({
    map(1:nrow(.data), ~material_column(
      width = floor(12 / nrow(.data)), class = "inline",
      mod_card_ui(ns(str_c("card", .x)))
    ))
  })
  
  map(1:nrow(.data), function(i) {
    .data %>%
      slice(i) %$%
      callModule(
        mod_card_server, str_c("card", i),
        value = value,
        name = name,
        gain = gain,
        ico = ico,
        color = color
      )
  })
  
}