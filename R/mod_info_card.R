#' info_card UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS
#' @importFrom stringr str_c str_sub
#' @importFrom dplyr if_else
mod_info_card_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("info_card"))
}

#' info_card Server Function
#'
#' @noRd 
mod_info_card_server <- function(input, output, session, value, name, gain, ico, color) {
  ns <- session$ns
  
  gain_color <- function(.gain) str_c("color: ", if_else(
    str_sub(.gain, end = 1) == "+", "#3fc1c9", "#fc5185"
  ))
  
  output$info_card <- renderUI({
    div(
      class = "card info-card",
      fluidRow(span(class = "card-value", value)),
      fluidRow(
        class = "info-card-body",
        column(width = 10, span(class = "card-name", name)),
        column(width = 2, class = "float-right", span(
          class = "card-gain", gain,
          style = gain_color(gain)
        ))
      ),
      fluidRow(
        class = "card-bottom",
        column(width = 8, class = "dropdown-button", actionButton(
          inputId = ns("dropdown"),
          label = "MONTHLY STATS",
          icon = icon("chevron-down")
        )),
        column(
          width = 4, class = "float-right ico",
          icon(ico), style = str_c("background-color: ", color)
        )
      )
    )
  })
}
