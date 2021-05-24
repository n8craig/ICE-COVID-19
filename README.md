ICE COVID-19 EDA
================
Nathan Craig
2021-04-25

-   [1 Introduction](#introduction)
    -   [1.1 Other Work on ICE COVID-19
        Data](#other-work-on-ice-covid-19-data)
    -   [1.2 AVID’s Work on COVID-19](#avids-work-on-covid-19)
-   [2 References](#references)

# 1 Introduction

This repository is composed of data that are initially reported on the
Immigration and Customs Enforcement [Guidance on
COVID-19](https://www.ice.gov/coronavirus) website. The way that ICE
reports the data do not lend themselves well to examining trends over
time. To remedy this, web scraping methods were employed to regularly
capture the data and compile it into summary tables. This repository
contains those data tables as well as some initial exploratory analysis
of these data. Some of the initial plots and insights are provided in
this file. Before embarking on that analysis I want to first acknowledge
some of the other fine work begin done to track COVID-19 data reported
by ICE.

## 1.1 Other Work on ICE COVID-19 Data

It is important to note that on November 18, 2020, Smart and Garcia
\[-@smart2020\] through the Vera Institute of Justice launched an
exceptional dashboard of ICE data entitled “[Tracking COVID-19 in
Immigration
Detention](https://www.vera.org/tracking-covid-19-in-immigration-detention).”
The dashboard includes some plots of summary trends as well as facet
plots of each facility. The report that goes with the dashboard details
some of the changes in how ICE has reported the data over time and some
of the issues with the data ICE supplied. Smart and Garcia’s
\[-@smart2020\] work also includes a
[GitHub](https://github.com/vera-institute/ice-detention-covid)
repository.

The UCLA Law COVID-19 Behind Bars Data Project, which contains a great
deal of information on COVID-19 in prisons, also includes a section on
“[COVID-19 in ICE Detention](https://uclacovidbehindbars.org/ice).” They
provide some useful maps and summary plots. The UCLA Law COVID-19 Behind
Bars Data Project developed an R package entitled
[`behindbarstools`](https://github.com/uclalawcovid19behindbars/behindbarstools)
that represents functions used by the project for pulling, cleaning,
wrangling, and visualizing the data they are collecting. Ishan Vedantham
Nagpal, who is part of the UCLA project, also has a
[repository](https://github.com/ivnagpal/ICE-COVID19) that uses python
to scrape ICE COVID data.

## 1.2 AVID’s Work on COVID-19

On Friday March 13, 2020 ICE suspended family and social visitation. I
visited a friend who was detained that the Otero County Processing
Center on that day. He had been held at the facility for nearly a year.
On March 27, 2020 ICE established the Guidance on COVID-19 web page and
indicated the site would be updated frequently. Shortly afterwards I
began logging the data on a daily basis, occasionally relying on the
Internet Archive’s Wayback Machine’s regular scrapes of the page to pick
up days that I missed.

In April of 2020, Advocate Visitors with Immigrants in Detention (AVID)
*in the Chihuahuan Desert* began raising concerns about the spread of
COVID-19 \[@brownvega2020\]. On April 30, AVID joined other immigrant
advocacy groups [calling for the
release](https://avid.chihuahuan.org/2020/04/30/community-groups-call-for-the-release-of-all-people-in-detention/)
of people from ICE detention due to COVID-19 health risks. On May 14,
2020 AVID [sent a
letter](https://avid.chihuahuan.org/2020/05/14/call-to-immediately-address-impending-public-health-care-disaster-of-ice-detention-in-new-mexico-and-el-paso-tx/)
to various public officials raising concerns about the spread of
COVID-19 in detention and calling for releases. On May 28, 2020 AVID
[sent an additional
letter](https://avid.chihuahuan.org/2020/05/28/continued-negligence-by-ice-and-private-contractors-requires-the-immediate-release-of-those-held-in-ice-detention-in-nm-and-el-paso-tx/)
to public officials again raising concerns about the spread of COVID-19
and medical negligence on the part of private detention contractors.
This letter contained one of the first graphs of ICE COVID-19 data
produced by AVID, at that point data were being manually copied and
pasted while the graph was constructed in Excel.

[![](images/2021-04-23%2019_00_22-AVID_Letter_NM_El_Paso_5-26-2020_Redacted.pdf%20%E2%80%94%20Mozilla%20Firefox.jpg)](https://avid.chihuahuan.org/2020/05/28/continued-negligence-by-ice-and-private-contractors-requires-the-immediate-release-of-those-held-in-ice-detention-in-nm-and-el-paso-tx/)

On June 17, 2020 AVID [sent a
letter](https://i2.wp.com/avid.chihuahuan.org/wp-content/uploads/sites/4/2020/06/ICE-COVID-19-Cases-OCPC-6-15-2020.png?resize=1024%2C710&ssl=1)
to Governor Lujan Grisham calling for her to prevent ICE from
transferring individuals into immigration detention centers located in
the state of New Mexico. In this letter, AVID again relied on data
scraped from the ICE [Guidance on
COVID-19](https://www.ice.gov/coronavirus) web page. AVID illustrated
how COVID-19 rates increased in the Otero County Processing Center after
a May 1, 2020 transfer of individuals from Otay Mesa to OCPC and how
there was a new increase in COVID-19 cases at OCPC after transfers
resumed again in mid-July of 2020. By this time, AVID was using python
to scrape the ICE web site and for constructing graphs of the data.

[![](https://i2.wp.com/avid.chihuahuan.org/wp-content/uploads/sites/4/2020/06/ICE-COVID-19-Cases-OCPC-6-15-2020.png?resize=1024%252C710&ssl=1)](https://avid.chihuahuan.org/2020/06/17/tell-lujan-grisham-to-end-ice-detention-transfers-in-nm/)

On June 30, 2020 AVID [generated a wrap
up](https://avid.chihuahuan.org/2020/06/30/covid-19-in-ice-detention-by-the-numbers-june-wrap-up/)
of COVID-19 in ICE detention and as part of that provided a bar graph
illustrating the number of cumulative COVID-19 cases by contractor. The
graph showed that the largest private prison contractors had the highest
number of COVID-19 cases. While this graph did not account for the fact
that private prison contractors constitute the majority of ICE detention
beds it does confirm that the majority of COVID-19 cases in ICE
detention occurred in privately contracted facilities.

[![](https://i0.wp.com/avid.chihuahuan.org/wp-content/uploads/sites/4/2020/06/COVID-19-Cases-by-Contractor-06-27-2020-1.png?ssl=1)](https://avid.chihuahuan.org/2020/06/30/covid-19-in-ice-detention-by-the-numbers-june-wrap-up/)

On July 16, 2020 AVID
[released](https://avid.chihuahuan.org/2020/07/16/cumulative-covid-19-cases-in-ice-detention/)
a plotly graph of Cumulative COVID-19 cases at all facilities as well as
an initial summary of several anomalies present in the ICE data. That
graphic continued to be updated until February 28, 2021. On November 25,
2020 AVID
[released](https://avid.chihuahuan.org/2020/11/25/pains-and-profits-of-immigration-imprisonment/)
a
[report](https://deptofgov.nmsu.edu/AVID-NSF-REU-Report-Final-Version-25-November-2020.pdf)
developed in collaboration with faculty from NMSU that addressed
concerns raised by migrants detained at the Otero County Processing
Center during the early part of the COVID-19 pandemic
\[@brownvega2020a\]. On January 2, 2021 AVID
[released](https://avid.chihuahuan.org/2021/01/02/process-by-torment/)
an additional
[report](https://avid.chihuahuan.org/wp-content/uploads/sites/4/2021/01/Process_by_Torment.pdf)
this time in conjunction with Innovation Law Lab that detailed in part
concerns expressed by migrants at the Otero County Processing Center
regarding COVID-19 and specifically the use of prolonged solitary
confinement for people who tested positive \[@craig2021\].

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
