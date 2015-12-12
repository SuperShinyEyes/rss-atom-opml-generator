require_relative "aggregator"
require "minitest/autorun"

class TestAggregator < Minitest::Test

    def setup
        @feed_hs = Feed.new("http://www.hs.fi/rss/?osastot=kotimaa")
        @feed_miehikkala = Feed.new("http://www.miehikkala.fi/d5webmiehi/cgi/DREQUEST.PHP?page=rss/meetingitems&show=30")
        @feed_type_unknown = Feed.new("http://cjc.jeunes-chercheurs.org/syndication/cneser.php")

    end

    def test_type
        # print @feed_type_unknown.url, String(@feed_type_unknown.feed.entries[0]).split(":")
        assert_equal("application/rss+xml", @feed_hs.type)
        assert_equal("application/rss+xml", @feed_miehikkala.type)
        assert_equal("application/atom+xml", @feed_type_unknown.type)
    end

    # def test_feed
    #     # assert_equal(Feedjira::Feed.fetch_and_parse("http://www.hs.fi/rss/?osastot=kotimaa").entries, @feed_hs.feed.entries)
    # end

    # def test_opml_header
    #     assert_equal()
    # end

end
