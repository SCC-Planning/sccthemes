#' Define piechart in scc colours
#'
#' @param df The dataframe provided
#' @param value The value of each group, no need to convert into a percentage
#' @param group The associated group for each value
#' @param title The title that should go above the plot
#' @param subtitle The subtitle that should go below the title
#'
#' @export
scc_piechart <- function(df, value, group, title = NULL, subtitle = NULL) {
  requireNamespace("forcats", quietly = TRUE)

  df <- df |>
    dplyr::arrange(dplyr::desc(group)) |>
    dplyr::mutate(value = value / sum(value) * 100)

  df2 <- df |>
    dplyr::mutate(
      csum = rev(cumsum(rev(value))),
      pos = value / 2 + dplyr::lead(csum, 1),
      pos = dplyr::if_else(is.na(pos), value / 2, pos)
    )

  p1 <- ggplot2::ggplot(
    df,
    ggplot2::aes(x = "", y = value, fill = forcats::fct_inorder(group))
  ) +
    ggplot2::geom_col(width = 1, color = 1) +
    ggplot2::coord_polar(theta = "y") +
    ggplot2::scale_fill_viridis_d() +
    ggplot2::geom_label_repel(
      data = df2,
      ggplot2::aes(y = pos, label = paste0(round(value, 1), "%")),
      fill = "white", size = 18, nudge_x = 1, show.legend = FALSE
    ) +
    ggplot2::labs(
      title = title,
      subtitle = subtitle
    ) +
    scc_style() +
    ggplot2::theme(
      axis.text.x = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank(),
      legend.position = "left", legend.text.align = 0
    )

  return(p1)
}
