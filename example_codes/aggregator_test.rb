require_relative "aggregator"
require "minitest/autorun"

class TestAggregator < Minitest::Test

    def setup
        @feed_hs = Feed.new("http://www.hs.fi/rss/?osastot=kotimaa")
        @feed_miehikkala = Feed.new("http://www.miehikkala.fi/d5webmiehi/cgi/DREQUEST.PHP?page=rss/meetingitems&show=30")

    end

    def test_type
        assert_equal("rss", @feed_hs.type)
    end

end
