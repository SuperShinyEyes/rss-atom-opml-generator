#!/usr/bin/ruby -w

FILENAME = 'blah.txt'

# http://ruby-doc.org/core-1.9.3/IO.html#method-c-read
# read() ensures the file is closed before returning
contents = File.read(FILENAME)
lines = File.readlines(FILENAME)

File.foreach(FILENAME) do |line|
  puts line.chomp
end
#
# lines.each do |i|
#     puts i.chomp
# end
