##Create a new oauth:
##1. in Github
##          Public profile
##              Developer settings
##                  OAuth Apps
##                     New OAuth App
##2.  Homepage URL: https://api.github.com/users/jtleek/repos
##    Authorization callback URL: http://localhost:1410
##
##3.  Save and get the Client ID and the Client Secret to use in the first step.



myapp <- oauth_app("github",
      key = "xxxxxxxxxxxxxxxxx",
      secret = "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

##Authentication complete

list(output[[15]]$name, output[[15]]$created_at)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
list(output[[datashare]]$name, output[[datashare]]$created_at)