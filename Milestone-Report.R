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
