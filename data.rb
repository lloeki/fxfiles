#!/usr/bin/env ruby

require 'base64'
require 'mime/types'

ARGV.each do |filename|
  File.open(filename) do |f|
    b64 = Base64.encode64(f.read).gsub("\n", '')
    ext = File.extname(filename)
    type = MIME::Types.type_for(ext).first.simplified
    puts "data:#{type};" << 'base64,' << b64
  end
end
