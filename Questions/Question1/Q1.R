


# ==== Delete =============== #

install.packages("esquisse")

library(esquisse)

esquisse::esquisser(SA_bonds)

# ============== Preamble to load packages ========================== #

# Install pacman to handle installations
install_github("trinker/pacman")

# Install the required packages in elagant approach
pacman::p_load(
    "tidyverse",
    "devtools",
    "rugarch",
    "forecast",
    "tbl2xts",
    "lubridate",
    "PerformanceAnalytics",
    "ggthemes",
    "robustbase",
    "tbl2xts",
    "PerformanceAnalytics",
    "ggplot2",
    "tidyverse"
)


SA_bonds <-
    read_rds("data/SA_Bonds.rds") # SA bond 2 year, 3 month and 10 year

BE_Infl <- read_rds("data/BE_Infl.rds")
bonds_2y <- read_rds("data/bonds_2y.rds") # International comparison
bonds_10y <- read_rds("data/bonds_10y.rds") # Internarion
usdzar <- read_rds("data/usdzar.rds") # US ZA currency
ZA_Infl <- read_rds("data/ZA_Infl.rds") # Inflation in South Africa (High inflation rate, leads to bond holders requring higher  returns off bonds and thus )
IV <- read_rds("data/IV.rds") # Volitility index


# ================ SA_bonds ==================== #

dim(SA_bonds)
colnames(SA_bonds)

# transformation: reshape to plot

xts.SA_bonds <-
    SA_bonds %>%
    select("date", "SA_3M", "ZA_10Yr", "ZA_2Yr") %>%
    tbl_xts()

# Look at the data: data is daily
head(SA_bonds, 3)
tail(SA_bonds, 3)


# Plotting with default lables is simple
esquisse::esquisser(SA_bonds)


p1 <-      ggplot(SA_bonds) +
    geom_line( aes(x = date, y = SA_3M), size = 0.5, colour = "red") +
    geom_line(aes(x = date, y = ZA_2Yr) ,size = 0.5, colour = "green") +
    geom_line(aes(x = date, y = ZA_10Yr) ,size = 0.5, colour = "blue") +
    labs(
        x = "Year",
        y = "Yields",
        subtitle = "South African bonds",
        caption = "Write caption here"
    ) +
    theme_minimal()

print(p1)


p2 <-      ggplot(SA_bonds) +
    geom_line( aes(x = date, y = SA_3M - ZA_10Yr), size = 0.5, colour = "red") +
    geom_line(aes(x = date, y = ZA_2Yr - ZA_10Yr) ,size = 0.5, colour = "green") +
    labs(
        x = "Year",
        y = "Spread ",
        subtitle = "South Africa current bond spreads",
        caption = "The current yield spreads in local mid to longer dated bond yields have been declining since 2020"
    ) +
    theme_bw()

print(p2)


p2 <-      ggplot(SA_bonds) +
    aes(x = date, y = ZA_10Yr) +
    geom_line(size = 0.5, colour = "#EF562D") +
    labs(
        x = "Year",
        y = "Yields",
        subtitle = "ZA 2 year ",
        caption = "Write caption here"
    ) +
    theme_minimal()
p2


colors <- c("SA_3M"="red","ZA_2Yr"="green", "ZA_10Yr"="blue" )


ggplot(SA_bonds, aes(x=date)) +
    geom_line( aes(y = SA_3M), size = 0.5, colour = "red") +
    geom_line(aes(y = ZA_2Yr) ,size = 0.5, colour = "green") +
    geom_line(aes(y = ZA_10Yr) ,size = 0.5, colour = "blue") +
    labs(
        x = "Year",
        y = "Yields",

    ) +
    scale_color_manual(values = colors)






# Create dummy dataframe
TempMax = c(1,2,3)
TempMedia = c(4,5,6)
TempMin = c(7,8,9)
data = as.data.frame( cbind(TempMax,TempMedia,TempMin))

# Create key of colurs for legend
colours = c("y1"="blue","y2"="black")


