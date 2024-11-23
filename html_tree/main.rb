require "./htmltree.rb"

content = ""
File.open("index.html", 'r') do |file|
    content = file.read
end

tree = HTMLTree.new()

tree.dfs.each do |element|
    print "#{element} "
end
puts ""

tree.bfs.each do |element|
    print "#{element} "
end