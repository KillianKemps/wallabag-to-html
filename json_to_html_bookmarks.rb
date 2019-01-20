require 'json'
require 'time'
require 'sanitize'

abort "Please give files to process" if ARGV.empty?

input_file = ARGV.shift
export_filename = ARGV.shift
export_filename = 'exported_bookmarks.html' if export_filename.empty? || export_filename.nil?

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
  article = "<DT><A HREF=\"#{item['url']}\" ADD_DATE=\"#{Time.parse(item['created_at']).to_i}\" TAGS=\"#{item['tags'].join(',')}\">#{item['title']}</A>\n"
  output << article
  article_content = "<DD>#{Sanitize.clean(item['content']).to_s[/^.{150}\s/]}\n"
  output << article_content
end

output << output_end

output_file = File.open(export_filename, 'w')

output_file.write(output)

output_file.close
