#BiME Kelp vs Turf Working Script. 
#Authors: Natalie M. and Jess K.
#Date of creation: July 6, 2020


# Loading of packages ----------------------------------------------------------------------
#Space for loading packages. (Jess which ones do you think we will need? dplyr, stringr, ggplot2?)

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


#=======
#=======
library(ggplot2)
library(stringr)
library(tidyr)
library(dplyr)
library(sciplot)

# Data Wrangling ---------------------------------------------------------------------------
kelp_data <- read.csv("kelp_turf_data_new.csv")
summary(kelp_data)
View(kelp_data)

#calculating mean % cover across quadrats for each site
aggregate(kelp_data[, 3:4], list(kelp_data$site_code), mean)
aggregate(kelp_data[, 3:4], list(kelp_data$site_code), sd)

#calculating mean species richness across quads for each site
aggregate(kelp_data[, 10:11], list(kelp_data$site_code), mean)
aggregate(kelp_data[, 10:11], list(kelp_data$site_code), sd)

#FIGURES

#Figure 2a. 
#plotting just kelp cover vs. max air temp
air_temp_kelp <- ggplot(data=kelp_data, aes(x=max_air_temp, y=kelp_cover)) +geom_point()+geom_smooth(method=lm, color="black") + labs(x="Maximum Air Temperature (ºC)", y="Percent Kelp Cover")+ kelp_theme
air_temp_kelp

lineplot.CI(x.factor = max_air_temp, response=kelp_cover, cex=1, pch=c(16,16, 16, 16, 16, 16, 16,16, 16, 16, 16, 16, 16,16, 16, 16, 16, 16, 16,16, 16, 16, 16, 16), xlab="Maximum Air Temperature (ºC)", ylab="Percent Kelp Cover", group=site_code, data=kelp_data, legend=FALSE, x.cont=FALSE)
axis(1, at=c(15,20,25,30, 35, 40))


#figure 2b
#plotting turf cover vs. max air temp
air_temp_turf <- ggplot(data=kelpdata, aes(x=max_air_temp, y=turf_cover)) +geom_point()+geom_smooth(method=lm, color="black") + labs(x="Maximum Air Temperature (ºC)", y="Percent Turf Cover")+ kelp_theme
air_temp_turf

#figure 2c
#average sst vs. kelp cover 
water_temp_kelp <- ggplot(data=kelpdata, aes(x=avg_sst, y=kelp_cover)) +geom_point()+geom_smooth(method=lm, color="black") + labs(x="Average Sea Surface Temperature (ºC)", y="Percent Kelp Cover")+ kelp_theme
water_temp_kelp

#figure 2d
#average sst vs. turf cover 
water_temp_turf <- ggplot(data=kelpdata, aes(x=avg_sst, y=turf_cover)) +geom_point()+geom_smooth(method=lm, color="black") + labs(x="Average Sea Surface Temperature (ºC)", y="Percent Turf Cover")+ kelp_theme
water_temp_turf

#test: does %cover correlate with richness?
kelp.turf <- lm(turf_richness~kelp_richness, data=kelp_data)
summary(kelp.turf)

#another figure
#kelp cover vs. turf cover
kelp_v_turf <- ggplot(data=kelp_data, aes(x=kelp_cover, y=kelp_cover))

#STATS: 
#playing around 

kelp.lm.final <- lm(kelp_cover~max_air_temp*avg_sst*barnacle_height, data=kelp_data)
summary(kelp.lm.final)
AIC(kelp.lm.final)

#MINI-TUTORIAL
#to run linear models use the lm() function
#ex: lm(response.variable~explanatory.variable1*explanatory.variable2, data=my.data)
#if you write * it will include the interaction between the explanatory variables and if you write + it WON'T include the interaction terms
kelp.lm <- lm(kelp_cover~barnacle_height*avg_sst, data=kelp_data)
kelp.lm.no.interaction <- lm(kelp_cover~barnacle_height+avg_sst, data=kelp_data)
#this function spits out the results of the linear model (this is where I got the R squared, and also where you get the p-values to tell if the relationship is significant)
summary(kelp.lm)
summary(kelp.lm.no.interaction)
#this is where I got the AIC values
AIC(kelp.lm)
#so what I would do is run all possible models including all explanatory variables in all combinations and then ranked them using AIC which is like a score of how good that model is 
#the model with the LOWEST AIC= the model that BEST explains the response variable 

#I will also send you the excel file where I inputted all of the model terms, AICs and R-squared values so you understand what I mean better 
#also if i was being a good scientist/R-person I would type each model out individually but I was lazy and just deleted/added in more terms to the same model over and over to get the AICs and R-squared values lol 

#same thing with richness
kelp.rich <-lm(kelp_richness~barnacle_height, data=kelp_data)
summary(kelp.rich)
AIC(kelp.rich)

#same thing with turf 
turf.lm <- lm(turf_cover~max_air_temp*avg_sst*barnacle_height, data=kelp_data)
summary(turf.lm)
AIC(turf.lm)
