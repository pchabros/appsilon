generate_data <- function() {

  set.seed(123)

  cards <- data.frame(
    value = c("$ 2 674 862", "657", "245", "12"),
    name = c("TOTAL PROFIT", "ACTIVE USERS", "NEW ORDERS", "OPEN COMPLAINTS"),
    gain = c("+4,5%", "+8,5%", "+3,9%", "-5,3%"),
    ico = c("database", "user", "box-open", "ellipsis-h"),
    color = c("#70a1d7", "#a1de93", "#f7f48b", "#f47c7c")
  )
  
  
  line_bar_plot <-
    data.frame(x = 1:26) %>%
    mutate(
      x_sin = sin(x * (1 - x / 100)),
      y = x_sin - min(x_sin) * rpois(length(x), 5),
      y_min = y - rpois(length(x), 3),
      y_max = y + rpois(length(x), 2),
      y_d = y_max - y_min,
      b_min = y_min + y_d * runif(1, min = 0.5),
      b_max = y + rpois(length(x), 20),
      line = x_sin * 2 + mean(b_max - b_min),
      s_min = y_min,
      s_max = b_max
    ) %.>%
    bind_rows(
      select(., x, min = s_min, max = s_max) %>% mutate(bar = "shadow"),
      select(., x, min = b_min, max = b_max, line) %>% mutate(bar = "blue"),
      select(., x, min = y_min, max = y_max) %>% mutate(bar = "yellow")
    )
  
  map <-
    data.frame(
      country = c("USA", "BRA", "ESP", "GER", "SWE"),
      value = c(10, 2, 5, 6, 8)
    )
  
  return(list(
    cards = cards,
    line_bar_plot = line_bar_plot,
    map = map
  ))
  
}