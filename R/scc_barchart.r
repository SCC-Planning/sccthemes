#' Define barchart in scc colours
#' 
#' @param data The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
scc_barchart <- function(data, x, y, title) {
  p1 <- data %>%
    ggplot(aes(x = x, y = y)) +
    geom_col(position = "identity", colour = "#333333", fill = "#2d6ca2") +
    geom_text(aes(
      y = mean(y * 0.5),
      label = paste(totals_formatting(y), "t")
    ),
    colour = "white"
    ) +
    geom_hline(yintercept = 0, size = 1, colour = "#333333") +
    labs(title = title) +
    scc_style()
  return(p1)
}

#' Define barchart with % values in scc colours
#' 
#' @param data The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
scc_barchart_pct <- function(data, x, y, title) {
  p1 <- data %>%
    ggplot(aes(x = x, y = y)) +
    geom_col(position = "identity", colour = "#333333", fill = "#2d6ca2") +
    geom_text(aes(
      y = mean(y * 0.5),
      label = paste(totals_formatting(y), "%")
    ),
    colour = "white"
    ) +
    geom_hline(yintercept = 0, size = 1, colour = "#333333") +
    labs(title = title) +
    scc_style()
  return(p1)
}

#' Define a grouped barchart in scc colours
#' 
#' @param data The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
scc_barchart_grouped <- function(data, x, y, group, title) {
  p1 <- data %>%
    ggplot(aes(x = x, y = y, fill = as.factor(group))) +
    geom_col(position = "dodge", colour = "#333333") +
    geom_hline(yintercept = 0, size = 1, colour = "#333333") +
    labs(title = title) +
    scc_style()
  return(p1)
}

#' Define barchart in scc colours, specifically for pupil/population numbers
#' 
#' @param data The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
scc_barchart_pupils <- function(data, x, y, title) {
  p1 <- data %>%
    ggplot(aes(x = x, y = y)) +
    geom_col(position = "identity", colour = "#333333", fill = "#2d6ca2") +
    geom_text(aes(
      y = mean(y * 0.5),
      label = paste(round(y, 2))
    ),
    colour = "white"
    ) +
    geom_hline(yintercept = 0, size = 1, colour = "#333333") +
    labs(title = title) +
    coord_flip() +
    scc_style()
  return(p1)
}

#' Define horizontal barchart in scc colours
#' 
#' @param data The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
scc_barchart_pupils_hor <- function(data, x, y, title) {
  p1 <- data %>%
    ggplot(aes(x = x, y = y)) +
    geom_col(position = "identity", colour = "#333333", fill = "#2d6ca2") +
    geom_hline(yintercept = 0, size = 1, colour = "#333333") +
    labs(title = title) +
    scc_style()
  return(p1)
}
