# Note that file paths may require double //
library(taskscheduleR)
job_path <- file.path(getwd(),"COVID_scrape_current_day.R")
taskscheduler_create(taskname = "R_COVID_19_ICE_Scrape", rscript = job_path, 
                     schedule = "MINUTE", starttime = "12:55", startdate = format(Sys.Date(), "%m/%d/%Y"))