#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom dplyr mutate bind_rows select mutate_at vars group_by ungroup everything case_when
#' @importFrom stringr str_to_upper
#' @importFrom tidyr pivot_longer
#' @importFrom purrr map_df
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
    mod_plot_card_server, "summary",
    title = "SUMMARY",
    .data = .data$bar_plot,
    plot_type = "bar_plot"
  )
  callModule(
    mod_map_card_server, "world_map",
    title = "SALES REVENUE BY COUNTRY",
    .data = .data$map,
    map_type = "world_map"
  )
}
