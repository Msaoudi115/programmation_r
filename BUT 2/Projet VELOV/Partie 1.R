install.packages("httr")
install.packages("fromjson")
library("httr")
library("jsonlite")

apiKey = "88513cafaa4c5466b2a0e37324cdb9b1d3c73d8c"
contract_name = "Lyon"
api_url <- paste0("https://api.jcdecaux.com/vls/v1/stations?contract=", contract_name, "&apiKey=", apiKey)
# OU
api_url <- "https://api.jcdecaux.com/vls/v1/stations?contract=Lyon&apiKey=88513cafaa4c5466b2a0e37324cdb9b1d3c73d8c"
raw_dataaa <- GET(api_url)
DLyon <- fromJSON(rawToChar(raw_dataaa$content), flatten = TRUE)

# Tuto BDD R https://www.slideshare.net/RsquaredIn/rmysql-tutorial-for-beginners

install.packages("RMySQL")
library("RMySQL")

con = dbConnect(MySQL(),
                user = "sql11646697",
                password = "3x2eA5a3nT",
                host = "sql11.freesqldatabase.com",
                dbname = "sql11646697")
summary(con)
dbWriteTable(con,"trial", DLyon)
dbListTables(con)
res = dbGetQuery(con, "SELECT * FROM trial;")
