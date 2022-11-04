#' Load the scc's font Source Sans Pro
#'
#' @details function that obtains the font files in inst/fonts
#' Source Sans Pro is the font currently used on the SCC website. This
#' function gets called in `scc_style()`
#'
#' @export
get_scc_font <- function() {
  sysfonts::font_add(
    "Source Sans Pro",
    regular = system.file(
      "font",
      "source-sans-pro.regular.ttf",
      package = "sccthemes"
    ),
    bold = system.file(
      "font",
      "source-sans-pro.bold.ttf",
      package = "sccthemes"
    ),
    italic = system.file("font",
                         "source-sans-pro.italic.ttf",
                         package = "sccthemes"
    ),
    bolditalic = system.file("font",
                             "source-sans-pro.bold-italic.ttf",
                             package = "sccthemes"
    )
  )

  showtext::showtext_auto()
}
