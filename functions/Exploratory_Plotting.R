## ---------------------------
##
## Script name: Plotting.R
##
## Purpose of script: 
##      Functions for making violin plot of the flipper data, saves to png and svg 
##
## Date Created: 2024-12-10
##
## ---------------------------

plot_flipper_violin <- function(penguins_flippers){
  penguins_flippers %>% 
    ggplot(aes(x = sex, y = flipper_length_mm, fill = sex)) + 
    geom_violin(alpha = 0.8, show.legend = FALSE) + 
    geom_point(color = "black", alpha = 0.3, size = 1.5, position = position_jitter(width = 0, height = 0)) +  # Smaller, semi-transparent points, no horizontal spread
    scale_fill_manual(values = c("lightblue", "pink")) + 
    labs(
      title = "Violin Plot of Flipper Length of Male and Female Adelie Penguins",
      x = "Sex",
      y = "Flipper length (mm)"
    ) +
    theme_bw(base_size = 15) +
    theme(
      axis.text = element_text(size = 10), 
      axis.title = element_text(size = 10),
      plot.title = element_text(hjust = 0.5, size = 12) 
    ) +
    theme(legend.position = "none")
}


save_flipper_violin_png <- function(penguins_flippers, filename, size, res, scaling) {
  agg_png(
    filename, 
    width = size, 
    height = size, 
    units = "cm", 
    res = res, 
    scaling = scaling
  )
  flipper_violin <- plot_flipper_violin(penguins_flippers)
  print(flipper_violin)
  dev.off()
}

save_flipper_plot_svg <- function(penguins_flippers, filename, size, scaling){
  svglite(filename, width = size, height = size, scaling = scaling)
  flipper_violin <- plot_flipper_violin(penguins_flippers)
  print(flipper_violin)
  dev.off()
}

