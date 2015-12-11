require_relative "aggregator"
# require "test/unit"

class TestAggregator < Test::Unit:TestCase

    def test
        assert_equal("rss", Feed.new("http://www.hs.fi/rss/?osastot=kotimaa").type)
    end

end
