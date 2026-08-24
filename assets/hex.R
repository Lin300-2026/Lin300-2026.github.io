library(hexSticker)
library(ggplot2)
library(showtext)
library(colorspace)
library(tidyverse)
library(scico)

font_add_google("Public Sans", "publicsans")
showtext_auto()

make_moving_sine <- function(df){
  params <- c("freq", "t")
  for (p in params){
    if (!p %in% names(df)){
      df[p] <- 1 
    }
  }
  
  df |> 
    mutate(
      y = (
        sin(
        (freq * (x - t)* 2 * pi)
        ) * dnorm(x, mean = 0.5, sd = 0.15)
      )/dnorm(0.5, mean = 0.5, sd = 0.15)
    )
}

expand_grid(
  x = seq(0, 1, length = 200),
  t = seq(0, 1, by = 0.1),
  freq = c(1)
) |> 
  filter(
    t < 1
  ) |> 
  ggplot(
    aes(
      x, freq = freq, t = t
    )
  ) +
  geom_line(
    aes(
      y = after_stat(y),
      color = t,
      group = t
    ),
    stat = "manual",
    fun = make_moving_sine,
    linewidth = 1.5,
    lineend = "round"
  ) +
  scale_color_scico(
    palette = "managua"
  ) +
  scale_x_continuous(
    expand = expansion(0)
  )+
  guides(
    color = "none"
  ) +
  theme_void() +
  theme_transparent() ->
  p


sticker(
  p+  annotate(
    geom = "rect",
    xmin = 0,
    xmax = 1,
    ymin = -0.5,
    ymax = 0.5,
    fill = "white",
    alpha = 0.6
  ),
  package="Lin300",
  p_size=12,
  p_color = "black",
  p_y = 1,
  s_x=1,
  s_y=1,
  s_width=1.7,
  s_height=1.8,
  p_family = "publicsans",
  p_fontface = "bold",
  filename = here::here("assets/logo.svg"),
  h_fill = lighten("#CCEEFF", amount = 0.75),
  h_color = darken("#CCEEFF", amount = 0.5)
)


sticker(
  p,
  package="",
  p_size=12,
  p_color = "black",
  p_y = 1,
  s_x=1,
  s_y=1,
  s_width=1.7,
  s_height=1.8,
  p_family = "publicsans",
  p_fontface = "bold",
  filename = here::here("assets/logo_small.svg"),
  h_fill = lighten("#CCEEFF", amount = 0.75),
  h_color = darken("#CCEEFF", amount = 0.5)
)

sticker(
  p +  
  # annotate(
  #   geom = "rect",
  #   xmin = 0,
  #   xmax = 1,
  #   ymin = -0.5,
  #   ymax = 0.5,
  #   fill = "white",
  #   alpha = 0.6
  # ) + 
    NULL,
  package="",
  p_size=40,
  p_color = "black",
  p_y = 1,
  s_x=1,
  s_y=1,
  s_width=1.7,
  s_height=1,
  p_family = "publicsans",
  p_fontface = "bold",
  filename = here::here("assets/logo.png"),
  h_fill = lighten("#CCEEFF", amount = 0.75),
  h_color = darken("#CCEEFF", amount = 0.5)
)
