# 2015 December 12th Saturday 03:38
# Author: Seyoung Park
# e-mail: king@seyoung.xyz

require_relative "opml_generator"
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
        assert_equal("application/atom+xml", @feed_type_unknown.type)
    end

end
