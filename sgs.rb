#!/usr/bin/env ruby

require 'csv'
require 'awesome_print'

data = {}
rdata = {}
CSV.foreach('sgs.csv', col_sep: '|', quote_char: '~') do |row|
  # ap({:row => row})
  lunakey = row[1]
  catkey = row[2] 
  catkey = $1.strip if catkey =~ /^catkey:(.*)$/
  title = row[4]
  catkey.split(/,/).each do |k|
    # k = k.to_i
    data[k] = {} unless data.include? catkey
    data[k][:lunakey] = [data[k][:lunakey], lunakey].flatten.compact.uniq.sort
    data[k][:title] = [data[k][:title], title].flatten.compact.uniq
  end #if catkey.length > 0
end

data.each do |k, v|
  v[:main_title] = v[:title].first if v[:title].length == 1  
end

# ap data

data.each do |k, v|
  s = v[:lunakey].flatten.sort.join(',')
  t = v[:main_title].gsub(/"/, '""')
  puts ",\"catkey:#{k}\",,\"#{t}\",\"#{s}\"" if v[:main_title]
end
