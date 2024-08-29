
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                Data Plotting                             ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Load libraries
library(tidyverse)
library(patchwork)


#.........................Potassium plot.........................

p1 <- ggplot(kplot, aes(x = date, y = k)) + 
  # we used smooth to reduce some of the noise of the data
  geom_smooth(span = 0.1, 
              aes(linetype = sample_id), 
              alpha = 0.001, 
              color = "black", 
              linewidth = 0.6) +
  scale_x_date(position = "top", 
               date_breaks = "12 months", 
               date_labels = "%Y", 
               date_minor_breaks = "2 months", 
               limits = c(ymd("1988-01-01"), ymd("1994-08-01")),
               guide = guide_axis(minor.ticks = TRUE)) +
  scale_y_continuous(breaks = c(0.4, 0.7, 1.0, 1.3, 1.6),
                     guide = guide_axis(minor.ticks = TRUE)) +
  labs(x = "Years",
       y = bquote('K mg'~l^-1)) +
  geom_vline(xintercept = ymd("1989-09-17"), 
             linetype = 2) +
  theme(panel.background = element_blank(),
        axis.text = element_text(colour = "black"),
        axis.ticks.x = element_line(color = "black"),
        axis.ticks.length = unit(-0.25, "cm"),
        legend.position = c(.80, .55),
        legend.title = element_blank(),
        legend.key = element_blank(),
        legend.key.size = unit(1.4, 'cm'),
        legend.background = element_blank(),
        text = element_text(size = 14, 
                            family = "sans serif", 
                            face = "bold"),
        legend.text = element_text(size = 16))


#.........................Nitrate plot.........................

p2 <- ggplot(plot1_df, aes(x = date, y = no3_n)) +
  # we used smooth to reduce some of the noise of the data
  geom_smooth(span = 0.1, 
              aes(linetype = sample_id), 
              alpha = 0.001, 
              color = "black", 
              linewidth = 0.6, 
              show.legend = FALSE) +
  scale_x_date(date_breaks = "12 months", 
               date_minor_breaks = "2 months", 
               limits = c(ymd("1988-01-01"), ymd("1994-08-01")),
               guide = guide_axis(minor.ticks = TRUE)) +
  scale_y_continuous(breaks = c(5, 100, 300, 500),
                     guide = guide_axis(minor.ticks = TRUE)) +
  ylab(bquote('NO'[3]-Nµg~l^-1)) +
  geom_vline(xintercept = ymd("1989-09-17"), 
             linetype = 2) +
  theme(axis.text.x=element_blank(),
        axis.title.x = element_blank(),
        panel.background = element_blank(),
        axis.text = element_text(colour = "black"),
        text = element_text(size = 14, family = "sans serif", face = "bold"),
        axis.ticks.length = unit(-0.25, "cm"),)


#......................... Final plot.........................

# Using patchwork to join potassium and nitrate plots together
# updating ggplot to 3.5 made it not work with patchwork anymore, had to update patchwork and other libraries
p1 / p2  & theme(plot.margin = margin(0, 0, 0, 10),
                 plot.background = element_rect(fill = "white"),
                 panel.background = element_rect(fill = "white"), 
                 panel.border = element_rect(color = "black", fill = NA))


# Save the plot for powerpoint use
ggsave(here("replica_plot.png"), width = 10, height = 6)

