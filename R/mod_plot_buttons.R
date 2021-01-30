#' plot_buttons UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
#' @importFrom shinyWidgets pickerInput
mod_plot_buttons_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("buttons"))
}

#' plot_buttons Server Function
#'
#' @noRd 
mod_plot_buttons_server <- function(input, output, session, choices, selected) {
  ns <- session$ns
 
  output$buttons <- renderUI({
    fluidRow(
      pickerInput(
        inputId = ns("date"),
        label = "", 
        choices = choices
      )
    )
  })
  
  observe({ selected(input$date) })
}
