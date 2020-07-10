#BiME Kelp vs Turf Working Script. 
#Authors: Natalie M. and Jess K.
#Date of creation: July 6, 2020


# Loading of packages ----------------------------------------------------------------------
#Space for loading packages. (Jess which ones do you think we will need? dplyr, stringr, ggplot2?)

<<<<<<< HEAD
<<<<<<< HEAD
library(ggplot2)
library(dplyr)

kelp_theme <- theme_classic() +
  theme(
    axis.title = element_text(size = 20, face="bold"),
    axis.text = element_text(size = 20, colour = "black"),
    axis.text.x = element_text(margin = margin(t = 10, unit = "pt")),
    legend.text=element_text(size=20), 
    legend.title=element_text(size=20, face="bold"), 
    legend.position=c(0.85,0.9),
    legend.background = element_blank(), 
    legend.key = element_blank(),
    text=element_text(family="Times New Roman"),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    panel.background = element_blank(), 
    axis.line= element_line(colour = "black"),
    strip.background = element_blank(),
    strip.text.y = element_blank())

kelpdata <- read.csv("kelp_turf_data.csv")
summary(kelpdata)

#plotting both kelp and turf cover vs. max air temp
air_temp_both <- ggplot(data=kelpdata, aes(x=max_air_temp, y=kelp_cover)) +geom_point()+geom_point(aes(x=max_air_temp, y=turf_cover), color="red") + labs(x="Maximum Air Temperature (ºC)", y="Percent Cover")+ kelp_theme
air_temp_both

#plotting just kelp cover vs. max air temp
air_temp_kelp <- ggplot(data=kelpdata, aes(x=max_air_temp, y=kelp_cover)) +geom_point()+geom_smooth(method=lm) + labs(x="Maximum Air Temperature (ºC)", y="Percent Kelp Cover")+ kelp_theme
air_temp_kelp

#plotting just turf cover vs. max air temp
air_temp_turf <- ggplot(data=kelpdata, aes(x=max_air_temp, y=turf_cover)) +geom_point()+geom_smooth(method=lm) + labs(x="Maximum Air Temperature (ºC)", y="Percent Turf Cover")+ kelp_theme
air_temp_turf

#=======
=======
library(ggplot2)
library(stringr)
library(tidyr)
library(dplyr)
>>>>>>> adda69f15c5d2deda754c1b9f6d564e355866125

# Data Wrangling ---------------------------------------------------------------------------
kelp_data <- read.csv("kelp_turf_data.csv")


# Figure 1. Site Map -----------------------------------------------------------------------

#See Nik's image 

# Figure 2. Abundance of kelp/turf cover as a function of wave exposure. -------------------
# started on this, but realized we don't have wave exposure data yet. ggplot(kelp_data, aes(x=)

# Figure 3. Abundance of kelp/turf cover as a function of temperature.----------------------
ggplot

# Figure 4. Species richness of kelp/turf cover as a function of wave exposure.-------------


# Figure 5. Species richness of kelp/turf cover as a function of temperature.---------------


# Figure 6. Generalized liner effects model for the interaction between temp ---------------


>>>>>>> 0ece3ba5d93f5b3f5f5dcd90b6b257b9c6710380
