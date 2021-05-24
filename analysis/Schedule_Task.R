# Note that file paths may require double //
library(taskscheduleR)
job_path <- file.path(getwd(),"analysis/COVID_scrape_current_day.R")
taskscheduler_create(taskname = "000stupid", rscript = job_path, 
                     schedule = "MINUTE", starttime = "10:00", startdate = format(Sys.Date(), "%m/%d/%Y"))