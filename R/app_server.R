#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom dplyr mutate bind_rows select
#' @importFrom wrapr %.>%
#' @noRd
app_server <- function(input, output, session) {
  
  .data <- generate_data()
  
  callModule(mod_info_cards_server, "top", .data = .data$cards)
  callModule(
    mod_plot_card_server, "production_plot",
    title = "PRODUCTION",
    .data = .data$line_bar_plot,
    plot_type = "line_bar_plot"
  )
  callModule(
    mod_map_card_server, "world_map",
    title = "SALES REVENUE BY COUNTRY",
    .data = .data$map,
    map_type = "world_map"
  )
}
