library(ggplot2)
library(scales)
library(knitr)
library(khroma)
#
# library(showtext)
#
# font_name <- "Noto Sans"
# font_add_google(name = font_name, family = font_name)
# showtext_auto()

knit_hooks$set(crop=hook_pdfcrop)

html_tag_audio <- function(file, type = c("wav")) {
  type <- match.arg(type)
  htmltools::tags$audio(
    controls = "",
    htmltools::tags$source(
      src = file,
      type = glue::glue("audio/{type}", type = type)
    )
  )
}

rev_log <- trans_new(
  name = "rev_log",
  trans = \(x) -log10(x),
  inverse = \(x) 10^(-x),
  breaks = breaks_log()
)

theme_set(
  theme_minimal(base_size = 18)+
  theme(
    panel.grid.minor = element_blank()
  )
)
