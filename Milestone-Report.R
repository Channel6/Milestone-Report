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
tweets <-  readLines("./data/final/en_US/en_US.twitter.txt", encoding = "UTF-8", skipNul=TRUE)

# News dataset looks like a raw binary file to R. To mitigate this, open the file as a stream,
# then read the data, line by line, into a new variable.
con <- file("./data/final/en_US/en_US.news.txt", open="rb")
news <- readLines(con, encoding="UTF-8", skipNul=TRUE)
close(con)
rm(con)

### Grab sample data.
head(blogs, 10)
head(tweets, 5)
head(news, 5)

## Basic report of summary statistics about the data sets

# Compute words per line info on each line for each data type
rawWPL<-lapply(
		list(blogs,news,twits),
		function(x) stri_count_words(x)
	)

# Compute statistics and summary info for each data type
rawstats<-data.frame(
	File=c("blogs","news","tweets"),
	t(
		rbind(
			sapply(
				list(blogs,news,twits),
				stri_stats_general
			),
			TotalWords=sapply(
				list(blogs,news,twits),
				stri_stats_latex
			)[4,]
		)
	),
	# Compute words per line summary
	WPL=rbind(
		summary(rawWPL[[1]]),
		summary(rawWPL[[2]]),
		summary(rawWPL[[3]])
	)
)
print(rawstats)

# Plot histogram for each data type
qplot(
	rawWPL[[1]],
	geom="histogram",
	main="Histogram for US Blogs",
	xlab="No. of Words",
	ylab="Frequency",
	binwidth=10
)
qplot(
	rawWPL[[2]],
	geom="histogram",
	main="Histogram for US News",
	xlab="No. of Words",
	ylab="Frequency",
	binwidth=10
)
qplot(
	rawWPL[[3]],
	geom="histogram",
	main="Histogram for US Tweets",
	xlab="No. of Words",
	ylab="Frequency",
	binwidth=1
)

rm(rawWPL);rm(rawstats)

## Report any interesting findings that you amassed so far


## Get feedback on your plans for creating a prediction algorithm and Shiny app
