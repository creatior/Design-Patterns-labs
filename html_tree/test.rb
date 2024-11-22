html_string = ""
file_name = "./index.html"
File.open(file_name, 'r') do |file|
    html_string = file.read
end

  tags = html_string.gsub(/\s+/, ' ').scan(/<\/?[^>]+>/)

  current_node = nil
  stack = []
  
  tags.each do |tag|
  	if tag =~ /<\/(\w+)>/
  		stack.pop
  		current_node = stack.last
  	elsif tag =~ /<(\w+)([^>]*)>/
  		tag_name, attr_name = $1, $2
  		puts tag_name, attr_name
  	end		
  end