#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    fluidPage(
      title = "",
      div(
        class = "wrapper",
        span(class = "title", "Enterprise Shiny Dashboard"),
        div(style = "height: 50px;"),
        mod_info_cards_ui("top"),
        div(style = "height: 30px;"),
        fluidRow(
          id = "plots-area",
          column(
            id = "plots-col",
            width = 6,
            column(width = 12, mod_plot_card_ui("production_plot")),
            column(width = 12, mod_plot_card_ui("summary"))
          ),
          column(width = 6, mod_map_card_ui("world_map"))
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  add_resource_path(
    'img', app_sys('app/img')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'appsilon'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

