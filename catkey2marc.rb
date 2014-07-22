#!/usr/bin/env ruby
#
# Usage: catkey2marc.rb catkey solrUrl
#
# Written by Darren Hardy
#
require 'rsolr'
require 'nokogiri'
# require 'awesome_print'

catkey = ARGV.first if ARGV.length > 0
if catkey.nil? or catkey !~ /^\d+$/
  STDERR.puts "Usage: #{File.basename(__FILE__)} catkey solrUrl"
  exit -1
end

solrServer = ARGV[1] if ARGV.length > 1

solr = RSolr.connect :url => solrServer
# ap({:solr => solr})

response = solr.get 'select', :params => {
  :qt => 'document', 
  :id => catkey, 
  :fl => 'marcxml'
}
# ap({:response => response})

if response['response']['docs'].length > 0
  marcXML = response['response']['docs'].first['marcxml']
  marcDoc = Nokogiri::XML(marcXML)
  puts marcDoc.to_xml indent: 2
else
  STDERR.puts "No record for catkey:#{catkey}"
  exit -1
end
