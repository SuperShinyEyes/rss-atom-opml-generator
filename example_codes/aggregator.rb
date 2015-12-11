

require 'feedjira'

=begin
RSS/Atom aggregator

1. Read file given as a parameter. For each line (an url):
2. Check the url point to a valid rss/atom feed
3. Get the feed title and description. These might be nil,
   if so replace them with "No title" and "No description".
4. Write an opml file with item for each url/title/description.

Example opml file
<?xml version="1.0" encoding="utf-8" ?>
<opml version="1.1">
<head>
<title>Generated by Seyoung</title>
<dateCreated>Sat, 05 Dec 2015 11:54:16 +0100</dateCreated>
</head>
<body>
<outline title="www.hs.fi/rss/?osastot=politiikka" text="www.hs.fi/rss/?osastot=politiikka" type="rss" xmlUrl="http://www.hs.fi/rss/?osastot=politiikka" />
</body></opml>

Ignore invalid urls and report them to a user.
Definition of invalid urls:
  1.Non-existing urls
  2.Invalid urls. ex) missing http://

You can read the whole file to ram and keep all urls,
titles and descriptions in ram until you write the opml.
Or you can read the file line by line and add items to the opml as you go.
=end


class Feed
    attr_reader :url, :feed, :type, :entries
    def initialize(url, feed=nil)
        @url = url
        @feed = get_feed(feed)
        @type = get_feed_type
        @entries = get_entries
        @time = Time.new
    end

    def get_feed(feed)
        if feed != nil
            return feed
        else
            return Feedjira::Feed.fetch_and_parse(@url)
        end
    end

    def get_feed_type(url=@url)
        if url.include? "rss"
            return "application/rss+xml"
        elsif url.include? "atom"
            return "application/atom+xml"
        else
            return "Unknown"
        end
    end

    def get_entries(feed=@feed, type=@type)
        entries = "<body>"
        feed.entries.each do |entry|
            entries += "\n<outline title=\"#{entry.title}\" text=\"#{entry.title}\" type=\"#{type}\" xmlUrl=\"#{entry.url}\"/>\n"
        end
        return entries + "</body>"
    end

    def get_opml_header(feed=@feed)
        opml_header = "<?xml version=\"1.0\" encoding=\"utf-8\" ?><opml version=\"1.1\">\n<head>\n"
        title = "<title>Generated by Defcomb OMPLBuilder: #{@time}</title>\n"
        dateCreated = "<dateCreated>#{@time}</dateCreated>\n</head>\n\n"
        return opml_header + title + dateCreated
    end

    def write_opml(save_path="")
        opml = get_opml_header + @entries + "\n</opml>"
        file_name = "#{save_path}#{@feed.description} - #{@time}.opml"
        File.write(file_name, opml)
    end

    def summary
        puts @url, @feed, @type, @entries
    end
end
