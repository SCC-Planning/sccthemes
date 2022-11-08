#' Define barchart in scc colours
#'
#' @param df_to_plot The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
#' @param subtitle The subtitle that should go below the title
#' @param format can be one of "report", "presentation" or "tweet". Will adjust
#' font sizes approriately for that format.
#'
#' @export
scc_barchart <- function(
    df_to_plot,
    x,
    y,
    title = NULL,
    subtitle = NULL,
    format = "report"
) {
  if (class(x) != "character") {
    x <- as.character(x)
  }

  if (class(y) != "character") {
    y <- as.character(y)
  }

  p1 <- df_to_plot |>
    ggplot2::ggplot(
      ggplot2::aes(
        x = df_to_plot[[x]], y = df_to_plot[[y]]
      )
    ) +
    ggplot2::geom_col(
      position = "identity",
      colour = "#333333",
      fill = "#2d6ca2"
    ) +
    ggplot2::geom_text(
      ggplot2::aes(
        y = mean(df_to_plot[[y]] * 0.5),
        label = totals_formatting(df_to_plot[[y]])
      ),
      colour = "white"
    ) +
    ggplot2::geom_hline(
      yintercept = 0,
      size = 1,
      colour = "#333333"
    ) +
    ggplot2::labs(
      title = title,
      subtitle = subtitle
    ) +
    scc_style()
  return(p1)
}

#' Define barchart with % values in scc colours
#'
#' @param df_to_plot The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
#' @param subtitle The subtitle that should go below the title
#' @param format can be one of "report", "presentation" or "tweet". Will adjust
#' font sizes approriately for that format.
#'
#' @export
scc_barchart_pct <- function(
    df_to_plot,
    x,
    y,
    title = NULL,
    subtitle = NULL,
    format = "report"
) {
  p1 <- df_to_plot |>
    ggplot2::ggplot(
      ggplot2::aes(
        x = df_to_plot[[x]], y = df_to_plot[[y]]
      )
    ) +
    ggplot2::geom_col(
      position = "identity",
      colour = "#333333",
      fill = "#2d6ca2"
    ) +
    ggplot2::geom_text(ggplot2::aes(
      y = mean(df_to_plot[[y]] * 0.5),
      label = paste(totals_formatting(df_to_plot[[y]]), "%")
    ),
    colour = "white"
    ) +
    ggplot2::geom_hline(
      yintercept = 0,
      size = 1,
      colour = "#333333"
    ) +
    ggplot2::labs(
      title = title,
      subtitle = subtitle
    ) +
    scc_style(format)
  return(p1)
}

#' Define a grouped barchart in scc colours
#'
#' @param df_to_plot The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param group the variable by which the chart should be grouped
#' @param title The title that should go above the plot
#' @param subtitle The subtitle that should go below the title
#' @param format can be one of "report", "presentation" or "tweet". Will adjust
#' font sizes approriately for that format.
#'
#' @export
scc_barchart_grouped <- function(
    df_to_plot,
    x,
    y,
    group,
    title = NULL,
    subtitle = NULL,
    format = "report"
) {
  p1 <- df_to_plot |>
    ggplot2::ggplot(
      ggplot2::aes(
        x = df_to_plot[[x]],
        y = df_to_plot[[y]],
        fill = as.factor(df_to_plot[[group]])
      )
    ) +
    ggplot2::geom_col(
      position = "dodge",
      colour = "#333333"
    ) +
    ggplot2::geom_hline(
      yintercept = 0,
      size = 1,
      colour = "#333333"
    ) +
    ggplot2::labs(
      title = title,
      subtitle = subtitle
    ) +
    scc_style(format)
  return(p1)
}

#' Define barchart in scc colours, specifically for pupil/population numbers
#'
#' @param df_to_plot The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
#' @param subtitle The subtitle that should go below the title
#' @param format can be one of "report", "presentation" or "tweet". Will adjust
#' font sizes approriately for that format.
#' @export
scc_barchart_pupils <- function(
    df_to_plot,
    x,
    y,
    title = NULL,
    subtitle = NULL,
    format = "report"
) {
  p1 <- df_to_plot |>
    ggplot2::ggplot(
      ggplot2::aes(
        x = df_to_plot[[x]],
        y = df_to_plot[[y]]
      )
    ) +
    ggplot2::geom_col(
      position = "identity",
      colour = "#333333",
      fill = "#2d6ca2"
    ) +
    ggplot2::geom_text(ggplot2::aes(
      y = mean(df_to_plot[[y]] * 0.5),
      label = paste(round(df_to_plot[[y]], 2))
    ),
    colour = "white"
    ) +
    ggplot2::geom_hline(yintercept = 0, size = 1, colour = "#333333") +
    ggplot2::labs(
      title = title,
      subtitle = subtitle
    ) +
    ggplot2::coord_flip() +
    scc_style(format)
  return(p1)
}

#' Define horizontal barchart in scc colours
#'
#' @param df_to_plot The dataframe provided
#' @param x The x-axis variable
#' @param y The y-axis variable
#' @param title The title that should go above the plot
#' @param subtitle The subtitle that should go below the title
#' @param format can be one of "report", "presentation" or "tweet". Will adjust
#' font sizes approriately for that format.
#'
#' @export
scc_barchart_pupils_hor <- function(
    df_to_plot,
    x,
    y,
    title = NULL,
    subtitle = NULL,
    format = "report"
) {
  p1 <- df_to_plot |>
    ggplot2::ggplot(
      ggplot2::aes(
        x = df_to_plot[[x]], y = df_to_plot[[y]]
      )
    ) +
    ggplot2::geom_col(
      position = "identity",
      colour = "#333333",
      fill = "#2d6ca2"
    ) +
    ggplot2::geom_hline(
      yintercept = 0,
      size = 1,
      colour = "#333333"
    ) +
    ggplot2::labs(
      title = title,
      subtitle = subtitle
    ) +
    scc_style(format)
  return(p1)
}
