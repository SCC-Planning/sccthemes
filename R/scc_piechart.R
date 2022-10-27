scc_piechart <- function(df, value, group, title = NULL, subtitle = NULL) {
  df <- df |>
    arrange(desc(group))  |>
    mutate(value = value / sum(value) * 100)


  df2 <- df |>
    mutate(csum = rev(cumsum(rev(value))),
           pos = value/2 + lead(csum, 1),
           pos = if_else(is.na(pos), value/2, pos))

  ggplot(df, aes(x = "" , y = value, fill = fct_inorder(group))) +
    geom_col(width = 1, color = 1) +
    coord_polar(theta = "y") +
    ggplot2::scale_fill_viridis_d() +
    geom_label_repel(data = df2,
                     aes(y = pos, label = paste0(round(value, 1), "%")),
                     fill = "white", size = 18, nudge_x = 1, show.legend = FALSE) +
    ggplot2::labs(
      title = title,
      subtitle = subtitle
    ) +
    scc_style() +
    theme(
      axis.text.x = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank(),
      legend.position = "left", legend.text.align = 0
    )
}
