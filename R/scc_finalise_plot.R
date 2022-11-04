#' Helper function for `finalise_ggplot()`, saving your plot
#'
#' @param plot_grid The variable name of the plot you have created that you
#'  want to format and save
#' @param width_pixels Width in pixels that you want to save your chart to
#' @param height_pixels Height in pixels that you want to save your chart to
#' @param save_filepath Exact filepath that you want the plot to be saved to
#' @export
save_plot <- function(plot_grid, width_pixels, height_pixels, save_filepath) {
  grid::grid.draw(plot_grid)

  ggplot2::ggsave(
    filename = save_filepath,
    plot = plot_grid,
    width = (width_pixels / 72),
    height = (height_pixels / 72),
    bg = "white"
  )
}

#' Helper function for `finalise_ggplot()`, left align text
#'
#' @param plot_name The variable name of the plot you have created that you
#'  want to format and save
#' @param pieces The pieces of your plot, ie Title, subtitle and caption
#'
#' @export
left_align_text <- function(plot_name, pieces) {
  grob <- ggplot2::ggplotGrob(plot_name)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

#' Helper function for `finalise_plot()`, create footer for your plot
#'
#' @param source_name The text you want to come after the text 'Source:'
#'  in the bottom left hand side of your side
#'
#' @export
create_footer <- function(source_name) {
  footer <- grid::grobTree(
    grid::linesGrob(
      x = grid::unit(c(0, 1), "npc"),
      y = grid::unit(1.1, "npc")
    ),
    grid::textGrob(
      source_name,
      x = 0.004,
      hjust = 0,
      gp = grid::gpar(fontsize = 16)
    )
  )
  return(footer)
}

#' Arrange alignment and save SCC ggplot chart
#'
#' Running this function will save your plot with the correct guidelines
#'  for publication for a SCC graphic. It will left align your title,
#'   subtitle and source and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you
#'  want to format and save
#' @param source_name The text you want to come after the text 'Source:'
#'  in the bottom left hand side of your side
#' @param save_filepath Exact filepath that you want the plot to be saved to
#' @param width_pixels Width in pixels that you want to save your chart to -
#' defaults to 640
#' @param height_pixels Height in pixels that you want to save your chart to -
#' defaults to 450
#'  which needs to be a PNG file
#'
#' @examples
#' \dontrun{
#' finalise_ggplot(
#'   plot_name = myplot,
#'   source = "The source for my data",
#'   save_filepath = "filename_that_my_plot_should_be_saved_to-nc.png",
#'   width_pixels = 640,
#'   height_pixels = 450,
#' )
#' }
#'
#' @export
finalise_ggplot <- function(
    plot_name,
    source_name,
    save_filepath = file.path(
      Sys.getenv("TMPDIR"),
      "tmp-nc.png"
    ),
    width_pixels = 640,
    height_pixels = 450) {
  requireNamespace("ggpubr", quietly = TRUE)

  footer <- create_footer(source_name)

  plot_left_aligned <- left_align_text(
    plot_name,
    c("subtitle", "title", "caption")
  )

  plot_grid <- ggpubr::ggarrange(
    plot_left_aligned,
    footer,
    ncol = 1,
    nrow = 2,
    heights = c(1, 0.045 / (height_pixels / 450))
  )

  save_plot(
    plot_grid,
    width_pixels,
    height_pixels,
    save_filepath
  )

  invisible(plot_grid)
}
