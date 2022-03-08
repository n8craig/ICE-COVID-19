:: Change into script directory
cd C:\Users\nmc\Nextcloud\AVID_Restricted\ICE_data\ICE-COVID-19\analysis\

:: Run COVID-19 scraping script
"C:\Program Files\R\R-4.1.0\bin\Rscript.exe" "COVID_scrape_current_day.R"

:: Change into COVID-19 project directory
cd C:\Users\nmc\Nextcloud\AVID_Restricted\ICE_data\ICE-COVID-19

::Initialize GitHub
::git init
	
::Pull any external changes (maybe you deleted a file from your repo?)
git pull
	
::Add all files in the directory
git add --all
	
::Commit all changes with the message "auto push". 
::Change as needed.
git commit -m "daily scrape update"
	
::Push all changes to GitHub 
git push 

:: Knit First Article
:: Change to website post directory
cd C:\Users\nmc\OneDrive - New Mexico State University\R-projects\ncraig\_posts\2021-06-30-current-ice-detention-population

:: Knit output
"C:\Program Files\R\R-4.1.0\bin\Rscript.exe" -e "library(rmarkdown); rmarkdown::render('current-ice-detention-population.Rmd', 'distill::distill_article')"

:: Knit Second Article
:: Change to website post directory
cd C:\Users\nmc\OneDrive - New Mexico State University\R-projects\ncraig\_posts\2021-07-26-cumulative-current-ice-covid-19

:: Knit output
"C:\Program Files\R\R-4.1.0\bin\Rscript.exe" -e "library(rmarkdown); rmarkdown::render('cumulative-current-ice-covid-19.Rmd', 'distill::distill_article')"

:: Change to website project directory
cd C:\Users\nmc\OneDrive - New Mexico State University\R-projects\ncraig\



::Pull any external changes (maybe you deleted a file from your repo?)
git pull
	
::Add all files in the directory
git add --all
	
::Commit all changes with the message "auto push". 
::Change as needed.
git commit -m "daily plot update"
	
::Push all changes to GitHub 
git push

cmd /k