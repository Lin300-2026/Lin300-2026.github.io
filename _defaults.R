library(ggplot2)
library(showtext)
library(colorspace)

# get plot fonts
font_add_google(name = "Public Sans", family = "Public Sans")
font_add_google(name = "Noto Sans", family = "Noto Sans")
font_add_google(name = "Voces", family = "Voces")
showtext_auto()

# Set global variable for setting fonts
# that aren't set by theme(text=...)
PLOT_FONT <- "Public Sans"

options(
  ggplot2.binned.colour = scico::scico(10, palette = "lipari"),
  ggplot2.binned.fill = scico::scico(10, palette = "lipari")
)


# from the theme _variables.scss
body_bg <- "#222222"
plot_bg <- darken("#375a7f", 0.50)
major <- lighten(
  plot_bg,
  amount = 0.25
)
minor <- lighten(
  plot_bg,
  amount = 0.125
)
strip_bg <- lighten(plot_bg, 0.5)

ptol_red <- "#EE6677"
ptol_blue <- "#4477AA"
ptol_green <- "#228833"

light_pal <-  c(
  "#BB5566", "#4477AA", "#228833", "#AA3377",
  "#666633", "#882255", "#225555",
  "#004488"
)


theme_set(
  theme_minimal(base_size = 16, accent = ptol_blue) +
    theme(
      text = element_text(family = "Public Sans"),
      palette.colour.discrete = c(
        "#BB5566", "#4477AA", "#228833", "#AA3377",
        "#666633", "#882255", "#225555",
        "#004488"
      ),
      palette.colour.continuous = scico::scico(10, palette = "managua")
    ) +
    theme_sub_panel(
      grid = element_blank(),
    ) +
    theme_sub_legend(
      key = element_blank(),
      background = element_blank()
    ) +
    theme_sub_axis(
      ticks = element_blank(),
      line = element_line(color = "grey60", linewidth = 0.2)
    )
)

theme_darkmode <- function(...) {
  theme_minimal(
    base_size = 16,
    paper = "#222",
    ink = "grey95",
    ...
  ) +
    theme(
      text = element_text(family = "Public Sans"),
      palette.color.discrete = c(
        "#CC6677", "#6699CC", "#117733", "#AA4499",
        "#999933", "#AA4466", "#44AA99",
        "#88CCEE"
      )
    ) +
    theme_sub_panel(
      background = element_rect(
        fill = "#424952", color = NA
      ),
      grid = element_blank()
    ) +
    theme_sub_legend(
      key = element_blank(),
      background = element_blank()
    ) +
    theme_sub_axis(
      line = element_line(
        color = "grey60", linewidth = 0.2
      )
    )
}

theme_no_y <- function(...) {
  theme_sub_axis_y(
    text = element_blank(),
    title = element_blank(),
    ...
  )
}

theme_no_x <- function(...) {
  theme_sub_axis_x(
    text = element_blank(),
    title = element_blank()
  )
}


# set a crop: true hook
knitr::knit_hooks$set(crop = knitr::hook_pdfcrop)
