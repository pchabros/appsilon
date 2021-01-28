#' info_card UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS
#' @importFrom shinymaterial material_card material_row material_column
#' @importFrom stringr str_c str_sub
#' @importFrom dplyr if_else
mod_info_card_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("card"))
}

#' info_card Server Function
#'
#' @noRd 
mod_info_card_server <- function(input, output, session, value, name, gain, ico, color) {
  ns <- session$ns
  
  gain_color <- function(.gain) str_c("color: ", if_else(
    str_sub(.gain, end = 1) == "+", "#3fc1c9", "#fc5185"
  ))
  
  output$card <- renderUI({
    material_card(
      title = "",
      class = "info-card",
      material_row(span(class = "card-value", value)),
      material_row(
        material_column(width = 8, span(class = "card-name", name)),
        material_column(width = 4, class = "float-right", span(
          class = "card-gain", gain,
          style = gain_color(gain)
        ))
      ),
      material_row(
        class = "card-bottom",
        material_column(width = 8, class = "dropdown-button", material_button(
          input_id = ns("dropdown"),
          label = "MONTHLY STATS",
          icon = icon("chevron-down")
        )),
        material_column(
          width = 4, class = "float-right ico",
          icon(ico), style = str_c("background-color: ", color)
        )
      )
    )
  })
}
