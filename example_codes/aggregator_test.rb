require_relative "aggregator"
require "minitest/autorun"

class TestAggregator < Minitest::Test

    def setup
        @feed_hs = Feed.new("http://www.hs.fi/rss/?osastot=kotimaa")
        @feed_miehikkala = Feed.new("http://www.miehikkala.fi/d5webmiehi/cgi/DREQUEST.PHP?page=rss/meetingitems&show=30")
        @feed_type_unknown = Feed.new("http://cjc.jeunes-chercheurs.org/syndication/cneser.php")

    end

    def test_type
        assert_equal("application/rss+xml", @feed_hs.type)
        assert_equal("application/rss+xml", @feed_miehikkala.type)
        assert_equal("Unknown", @feed_type_unknown.type)
    end

    # def test_opml_header
    #     assert_equal()
    # end

end
