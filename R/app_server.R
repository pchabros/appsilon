#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  cards_data <- data.frame(
    value = c("$ 2 674 862", "657", "245", "12"),
    name = c("TOTAL PROFIT", "ACTIVE USERS", "NEW ORDERS", "OPEN COMPLAINTS"),
    gain = c("+4,5%", "+8,5%", "+3,9%", "-5,3%"),
    ico = c("database", "user", "box-open", "ellipsis-h"),
    color = c("#70a1d7", "#a1de93", "#f7f48b", "#f47c7c")
  )
  
  callModule(mod_info_cards_server, "top", .data = cards_data)
  
}
