#!/usr/bin/env ruby

require 'csv'
require 'awesome_print'

data = {}
rdata = {}
CSV.foreach('rumsey.csv', col_sep: '|', quote_char: '~') do |row|
  catkey = row[1] 
  catkey = $1.strip if catkey =~ /^catkey:(.*)$/
  puts "XXXXXXX" unless catkey.length == 0
  title = row[3]
  rumseykey = nil
  rumseykey = $1 if row[4] =~ /Rumsey-ImageNo_(\d+)_/
  files = [row[5], row[6], row[7]].compact
  catkey.split(/,/).each do |k|
    # k = k.to_i
    rdata[k] = rumseykey if rumseykey
    data[k] = {} unless data.include? catkey
    data[k][:title] = [data[k][:title], title].flatten.compact
    data[k][:files] = [data[k][:files], files].flatten.compact
  end #if catkey.length > 0
end

data.each do |k, v|
  v[:main_title] = v[:title].first if v[:title].length == 1
  
  if z = v[:title].grep(/^Title Page:\s*(.*)$/).first
    v[:main_title] = $1 if z =~ /^Title Page:\s*(.*)$/
  end
  
  unless v[:main_title]
    v[:title].each do |t|
      unless t =~ /:/
        v[:main_title] = t
        break
      end
    end
  end
end
ap data
exit
data.each do |k, v| 
  puts "||catkey:#{k}|rumsey:#{rdata[k]}|#{v[:main_title]}||" if v[:main_title] and rdata[k]
end
