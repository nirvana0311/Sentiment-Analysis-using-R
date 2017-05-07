" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)"
The above expression explained:

? optional space
(f|ht) match "f" or "ht"
tp match "tp"
(s?) optionally match "s" if it's there
(://) match "://"
(.*) match every character (everything) up to
[.|/] a period or a forward-slash
(.*) then everything after that
I'm not an expert with regular expressions, but I think I explained that correctly.

You can use gsub with a regular expression to match URLs,

Set up a vector:

x <- c(
    "download file from http://example.com", 
    "this is the link to my website http://example.com", 
    "go to http://example.com from more info.",
    "Another url ftp://www.example.com",
    "And https://www.example.net"
)
Remove all the URLs from each string:

gsub(" ?(f|ht)tp(s?)://(.*)[.][a-z]+", "", x)
# [1] "download file from"             "this is the link to my website"
# [3] "go to from more info."          "Another url"                   
# [5] "And"   
Update: It would be best if you could post a few different URLs so we know what we're working with. But I think this regular expression will work for the URLs you mentioned in the comments: