#' Creating an scc style sticker for R packages
#'
#' @param imgurl url of the scc logo
#' @param package_name name of the package
#' @param font name of the font, ie "Source Sans Pro"
#'
#' @export
create_scc_sticker <- function(imgurl, package_name, font) {

  get_scc_font()

  hexSticker::sticker(
    imgurl,
    package = package_name,
    p_size = 15,
    p_fontface = "bold",
    s_x = 1,
    s_y = 1.1,
    s_width = 0.75,
    s_height = 1,
    p_x = 1.15,
    p_y = 0.77,
    h_fill = "#2d6ca2",
    h_color = "#e8850c",
    p_family = font, filename="inst/figures/scc-hex.png"
  )
}
