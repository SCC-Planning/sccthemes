#' Load the scc's font Source Sans Pro
#'
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
