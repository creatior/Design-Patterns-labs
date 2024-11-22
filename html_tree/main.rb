require "./htmltree.rb"

content = ""
File.open("index.html", 'r') do |file|
    content = file.read
end

tree = HTMLTree.new()

tree.each {|tag| puts tag}