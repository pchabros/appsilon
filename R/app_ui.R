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
        div(style = "height: 10px;"),
        fluidRow(
          id = "plots-area",
          div(
            id = "plots-col",
            class = "col-lg-6",
            fluidRow(column(width = 12, mod_plot_card_ui("production_plot"))),
            fluidRow(column(width = 12, mod_plot_card_ui("summary")))
          ),
          div(class = "col-lg-6", mod_plot_card_ui("world_map"))
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
  )
}

