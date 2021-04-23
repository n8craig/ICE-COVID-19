ICE COVID-19 EDA
================
Nathan Craig
2021-04-23

-   [1 Introduction](#introduction)
    -   [1.1 Other Work on ICE COVID-19
        Data](#other-work-on-ice-covid-19-data)
    -   [1.2 AVID’s Work on COVID-19](#avids-work-on-covid-19)
-   [2 References](#references)

# 1 Introduction

This repository is composed of data originally reported on the
Immigration and Customs Enforcement Guidance on COVID-19 website. This
file presents some of the initial plots and insights that come from
exploring these data. Before embarking on that I want to first
acknowledge some of the other fine work begin done to track COVID-19
data reported by ICE.

## 1.1 Other Work on ICE COVID-19 Data

It is important to note that on November 18, 2020, Smart and Garcia
(2020) through the Vera Institute of Justice launched a very fine
dashboard of ICE data entitled “[Tracking COVID-19 in Immigration
Detention](https://www.vera.org/tracking-covid-19-in-immigration-detention).”
Their work also includes a
[GitHub](https://github.com/vera-institute/ice-detention-covid)
repository. There is also the UCLA Law COVID-19 Behind Bars Data Project
which also includes a section on “[COVID-19 in ICE
Detention](https://uclacovidbehindbars.org/ice).” This group developed
the
[`behindbarstools`](https://github.com/uclalawcovid19behindbars/behindbarstools)
which is an R package used by the project for pulling, cleaning,
wrangling, and visualizing the data they are collecting. Ishan Vedantham
Nagpal, who is part of the UCLA project, has a
[repository](https://github.com/ivnagpal/ICE-COVID19) that uses python
to scrape ICE COVID data.

## 1.2 AVID’s Work on COVID-19

In April of 2020, Advocate Visitors with Immigrants in Detention (AVID)
*in the Chihuahuan Desert* began raising concerns about the spread of
COVID-19 (Brown Vega and Craig 2020).

On Friday March 13, 2020 ICE suspended family and social visitation. On
March 27, 2020 ICE established the Guidance on COVID-19 web page and
indicated the site would be updated frequently. Shortly afterwards I
began logging the data on a daily basis, occasionally relying on the
Internet Archive’s Wayback Machine’s regular scrapes of the page to pick
up days that I missed.

``` r
# Load Libraries
library(readr)
library(summarytools)
```

    ## Registered S3 method overwritten by 'pryr':
    ##   method      from
    ##   print.bytes Rcpp

``` r
st_options(plain.ascii = FALSE,
           footnote = NA,
           subtitle.emphasis = FALSE,
           round.digits = 2)
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.3     v dplyr   1.0.5
    ## v tibble  3.1.0     v stringr 1.4.0
    ## v tidyr   1.1.3     v forcats 0.5.1
    ## v purrr   0.3.4

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()
    ## x tibble::view()  masks summarytools::view()

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

``` r
library(ggplot2)
library(ggstatsplot)
```

    ## Registered S3 method overwritten by 'parameters':
    ##   method     from      
    ##   ci.blavaan bayestestR

    ## In case you would like cite this package, cite it as:
    ##      Patil, I. (2018). ggstatsplot: "ggplot2" Based Plots with Statistical Details. CRAN.
    ##      Retrieved from https://cran.r-project.org/web/packages/ggstatsplot/index.html

``` r
library(knitr)
options(digits=3)
opts_chunk$set(results = 'asis',
               comment = NA,
               prompt = FALSE,
               cache = FALSE)
# Turn off scientific notation
options(digits=5, scipen=15)
```

``` r
# Load Dataset
df_summary <- read_csv("./data/covid_summaries.csv", 
    col_types = cols(Date = col_date(format = "%m/%d/%Y"), 
        `Total Deaths` = col_double(), `Total COVID-19 Confirmed in Custody` = col_double()))
```

``` r
# ICE Detention Population Over Time
ggplot(df_summary, aes(x=Date, y=`Total Detained`))+
  geom_line()+
  geom_point()+
  geom_smooth()+
  labs(
    title = "ICE Detention Population Over Time",
    subtitle = "Smoothed trend line added",
    caption = "Data source: https://www.ice.gov/coronavirus"
  )
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    Warning: Removed 27 rows containing non-finite values (stat_smooth).

    Warning: Removed 27 row(s) containing missing values (geom_path).

    Warning: Removed 27 rows containing missing values (geom_point).

![](README_files/figure-gfm/ICE%20Detention%20Population-1.png)<!-- -->

``` r
# Total Confirmed COVID-19 Over Time
ggplot(df_summary, aes(x=Date, y=`Total COVID-19 Confirmed in Custody`))+
  geom_line()+
  geom_smooth()+
   labs(
    title = "Total Number of Confirmed COVID-19 Cases in ICE Detention Over Time",
    subtitle = "Smoothed trend line added",
    caption = "Data source: https://www.ice.gov/coronavirus"
  )
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    Warning: Removed 63 rows containing non-finite values (stat_smooth).

    Warning: Removed 63 row(s) containing missing values (geom_path).

![](README_files/figure-gfm/Total%20Confirmed%20COVID-19-1.png)<!-- -->

``` r
# Ratio Confirmed by Total Detained
df_summary %>% 
  mutate(`Confirmed Detained Ratio` = `Total COVID-19 Confirmed in Custody`/`Total Detained`) %>%
  ggplot(aes(x=Date, y=`Confirmed Detained Ratio`))+

  geom_line()+
  geom_smooth()+
   labs(
    title = "Ratio of Confirmed COVID-19 Cases in ICE Detention by \nTotal ICE Detention Population Over Time",
    subtitle = "Smoothed trend line added",
    caption = "Data source: https://www.ice.gov/coronavirus"
  )
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    Warning: Removed 63 rows containing non-finite values (stat_smooth).

    Warning: Removed 63 row(s) containing missing values (geom_path).

![](README_files/figure-gfm/Ratio%20Confirmed%20by%20Total%20Detained-1.png)<!-- -->

``` r
# Cumulative COVID-19
ggplot(df_summary, aes(x=Date, y=`Total Cumulative COVID-19`))+
  geom_line()+
  geom_smooth()+
   labs(
    title = "Cumulative COVID-19 Cases in ICE Detention Over Time",
    subtitle = "Smoothed trend line added",
    caption = "Data source: https://www.ice.gov/coronavirus"
  )
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](README_files/figure-gfm/Cumulative%20COVID-19-1.png)<!-- -->

``` r
# Total COVID-19 Tests
ggplot(df_summary, aes(x=Date, y=`Total Tested`))+
  geom_line()+
  geom_smooth()+
   labs(
    title = "Total Number of COVID-19 Tests in ICE Detention Population Over Time",
    subtitle = "Smoothed trend line added",
    caption = "Data source: https://www.ice.gov/coronavirus"
  )
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    Warning: Removed 31 rows containing non-finite values (stat_smooth).

    Warning: Removed 31 row(s) containing missing values (geom_path).

![](README_files/figure-gfm/Total%20COVID-19%20Tests-1.png)<!-- -->

``` r
# Total Deaths in ICE Custody
ggplot(df_summary, aes(x=Date, y=`Total Deaths`))+
  geom_line()+
  geom_smooth()+
   labs(
    title = "Total Number of Deaths in ICE Detention Over Time",
    subtitle = "Smoothed trend line added",
    caption = "Data source: https://www.ice.gov/coronavirus"
  )
```

    `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    Warning: Removed 63 rows containing non-finite values (stat_smooth).

    Warning: Removed 63 row(s) containing missing values (geom_path).

![](README_files/figure-gfm/Total%20Deaths%20in%20ICE%20Custody-1.png)<!-- -->

# 2 References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-brownvega2020" class="csl-entry">

Brown Vega, Margaret, and Nathan Craig. 2020. “Commentary: Continued ICE
Detention Risks Spread of COVID-19 in El Paso Region.”
<https://elpasomatters.org/2020/04/05/commentary-continued-ice-detention-risks-spread-of-covid-19-in-el-paso-region/>.

</div>

<div id="ref-smart2020" class="csl-entry">

Smart, Noelle, and Adam Garcia. 2020. “Tracking COVID-19 in Immigration
Detention: A Dashboard of ICE Data.”
<https://www.vera.org/tracking-covid-19-in-immigration-detention>.

</div>

</div>
