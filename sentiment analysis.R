#reference url:https://www.r-bloggers.com/twitter-sentiment-analysis-with-r/
getwd()
setwd("C:\\Users\\nirva\\IdeaProjects\\R")
require(twitteR)
require(ROAuth)
Consumer_Key="OPPA5VhYKtsRugJBYyYQvIEWQ"
Consumer_Secret ="8KAJDzmLog4Tjfwl2bMGPdqftMAN9uHdAxv01frkEZXfjrrjbT"
Access_Token=	"129692093-51O6nZGHOAluZ77k12wnaFTRi5JfndPb2J5XxyxT"
Access_Token_Secret=	"0buLfcCCVtNcKlr3YClmdj4gT0cPWgz7o6k1G3JgaFYvn"
setup_twitter_oauth(consumer_key = Consumer_Key,consumer_secret = Consumer_Secret,access_token = Access_Token,access_secret = Access_Token_Secret)
download.file(url = "http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")
Request_token_URL="https://api.twitter.com/oauth/request_token"
Authorize_URL=	"https://api.twitter.com/oauth/authorize"
Access_token_URL=	"https://api.twitter.com/oauth/access_token"

cred=OAuthFactory$new(consumerKey=Consumer_Key,
                      consumerSecret=Consumer_Secret,
                      requestURL=Request_token_URL,
                      accessURL=Access_token_URL,
                      authURL=Authorize_URL)

#library(RCurl) 
#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "C:/Users/nirva/IdeParojects/R/cacert.pem", package = "RCurl")))
#cred$handshake(cainfo="C:\\Users\\nirva\\IdeaProjects\\R\\cacert.pm")
cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl'))
trump_tweet=searchTwitter("Trump",n=150)
df=do.call('rbind',lapply(trump_tweet,as.data.frame))

