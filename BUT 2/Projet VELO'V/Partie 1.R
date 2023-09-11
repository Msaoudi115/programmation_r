apiKey = "88513cafaa4c5466b2a0e37324cdb9b1d3c73d8c"
contract_name = "Lyon"
api_url <- paste0("https://api.jcdecaux.com/vls/v1/stations?contract=", contract_name, "&apiKey=", apiKey)
# OU
api_url <- "https://api.jcdecaux.com/vls/v1/stations?contract=Lyon&apiKey=88513cafaa4c5466b2a0e37324cdb9b1d3c73d8c"
raw_dataaa <- GET(api_url)
DLyon <- fromJSON(rawToChar(raw_dataaa$content), flatten = TRUE)

