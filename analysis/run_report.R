# Loading libraries [install the libraries before if not already installed]
library(knitr)
library(rmarkdown)

# Knits rmd file (.Rmd is saved in the working directory)
knit("C:\\Users\\nmc\\Nextcloud\\AVID_Restricted\\ICE_data\\ICE-COVID-19\\analysis\\COVID_Summary_Plots.Rmd")

# Creates the html output
render("C:\\Users\\nmc\\Nextcloud\\AVID_Restricted\\ICE_data\\ICE-COVID-19\\analysis\\COVID_Summary_Plots.Rmd")