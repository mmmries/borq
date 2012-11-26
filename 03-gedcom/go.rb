require 'builder'
require_relative 'gedcom'

f = File.new("test.ged","r")
b = Builder::XmlMarkup.new

g = Gedcom.new(f, b)
puts g.builder.to_s
