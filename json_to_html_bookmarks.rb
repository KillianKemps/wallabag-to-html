require 'json'
require 'time'

abort "Please give files to process" if ARGV.empty?

input_file = ARGV.shift

loaded_file = JSON.load(File.open(input_file))

output_begin = '''
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>
<DL><p>
'''

output_end = '</DL><p>'

output = output_begin

for item in loaded_file do
  article = "<DT><A HREF=\"#{item['url']}\" ADD_DATE=\"#{Time.parse(item['created_at']).to_i}\" TAGS=\"#{item['tags']}\">#{item['title']}</A>\n"
  output << article
end

output << output_end

output_file = File.open('exported_bookmarks.html', 'w')

output_file.write(output)

output_file.close
