#!/usr/bin/env ruby

require 'find'
require 'yaml'

images = Find.find('./').grep(/.png/).reject{|f| f =~ /_/}


commands = images.map{|f| "convert -geometry 128x128! #{f} #{f.sub('.png', '.jpg')}"}

commands.each do |c|
  system(c)
end

puts ({'emojis' => images.map{|i| { 'name' => File.basename(i, '.*'), 'src' => File.expand_path(i).sub('.png', '.jpg') }}}).to_yaml






