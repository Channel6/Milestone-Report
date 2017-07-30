## download data
SwiftKey_data_url = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
SwiftKey_destination_zip = "Coursera-SwiftKey.zip"

if (!file.exists("./data/final")) {
  if (!file.exists(paste0("./data/", SwiftKey_destination_zip))) {
    download.file(
      SwiftKey_data_url,
      destfile = SwiftKey_destination_zip,
      quiet=TRUE
    )
  }
  
  unzip("Coursera-SwiftKey.zip", exdir = "./data");
}
###only English loading
blogs <- readLines("./data/final/en_US/en_US.blogs.txt", encoding = "UTF-8", skipNul=TRUE)
twitter <-  readLines("./data/final/en_US/en_US.twitter.txt", encoding = "UTF-8", skipNul=TRUE)

# News dataset looks like a raw binary file to R. To mitigate this, open the file as a stream,
# then read the data, line by line, into a new variable.
con <- file("./data/final/en_US/en_US.news.txt", open="rb")
news <- readLines(con, encoding="UTF-8", skipNul=TRUE)
close(con)
rm(con)

### Grab sample data.
head(blogs, 10)
head(twitter, 5)
head(news, 5)

## Basic report of summary statistics about the data sets


## Report any interesting findings that you amassed so far


## Get feedback on your plans for creating a prediction algorithm and Shiny app
