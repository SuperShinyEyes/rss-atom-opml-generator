require_relative "aggregator"

def main(file_name, save_path="")
    # Split a text file by lines without newline characters
    urls = File.readlines(file_name).each {|l| l.chomp!}
    error = 0
    total = 0

    urls.each do |url|
        begin
            total += 1
            feed = Feedjira::Feed.fetch_and_parse(url)
        rescue Feedjira::NoParserAvailable, NoMethodError => e
            error += 1
            puts "(#{error}/#{total}) Error: Feedjira couldn't parse - #{e}\n\t#{url}"
        else
            f=Feed.new(url, feed)
            f.write_opml save_path
            puts "(#{total-error}/#{total}) Successfully read #{url}"
        ensure
        end
    end
end

main("dummy_urls.txt", "../opml/")
