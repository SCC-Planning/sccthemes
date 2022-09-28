#' Load the scc's font Source Sans Pro
#' 
sysfonts::font_add(
  "Source Sans Pro",
  regular = here::here("font", "source-sans-pro.regular.ttf"),
  bold = here::here("font", "source-sans-pro.bold.ttf"),
  italic = here::here("font", "source-sans-pro.italic.ttf"),
  bolditalic = here::here("font", "source-sans-pro.bold-italic.ttf")
)

showtext::showtext_auto()
