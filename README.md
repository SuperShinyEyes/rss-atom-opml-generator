Hi! Are you in a hurry this weekend? Want to try a small project with Ruby?
Just a small script that takes a file with urls (rss/atom feeds) as input, goes to every url, parses feed title and description from them and creates an opml file containing all the urls from the original file.
Should be about 20 lines of code.
You can use Feedjira to fetch the feed and get the title and description.
Fetch the feed:
url = "http://feedjira.com/blog/feed.xml"
feed = Feedjira::Feed.fetch_and_parse url
And then you get the title:
feed.title
And an example of opml with just one item in it:

<?xml version="1.0" encoding="utf-8" ?>
<opml version="1.1">
<head>
<title>Generated by Seyoung</title>
<dateCreated>Sat, 05 Dec 2015 11:54:16 +0100</dateCreated>
</head>
<body>
<outline title="www.hs.fi/rss/?osastot=politiikka" text="www.hs.fi/rss/?osastot=politiikka" type="rss" xmlUrl="http://www.hs.fi/rss/?osastot=politiikka" />
</body></opml>

You can install Ruby by using RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
Close terminal and open a new one
rvm use 2.2.1
More documentation if needed:
https://rvm.io/rvm/install
http://feedjira.com/


Classe are CamelCase in ruby and variable are under_lined. Except CONSTANTS.

## Examples

It's just a bunch of urls. For example:

http://www.hs.fi/rss/?osastot=kotimaa
http://www.miehikkala.fi/d5webmiehi/cgi/DREQUEST.PHP?page=rss/meetingitems&show=30
http://www.google.fi
http://www.liuaefhluhkfaelkuhsaef.xyz
First 2 are valid feeds, 3rd is a valid url, but not a feed. 4th isn't even a valid url (hopefully).


## Instructions
1. Read file given as a parameter. For each line (an url):
2. Check the url point to a valid rss/atom feed
3. Get the feed title and description. These might be nil, if so replace them with "No title" and "No description".
4. Write an opml file with item for each url/title/description.
You can read the whole file to ram and keep all urls, titles and descriptions in ram until you write the opml.
Or you can read the file line by line and add items to the opml as you go.
Feedjira can:
Make request for the url
Validate the feed
Get the title and description