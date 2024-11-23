class Binary_iterator include Enumerable
   def initialize(root)
       @root = root
   end

   def each(&block)
       bfs(@root, &block)
   end

   private

   def bfs(node, &block)
       return if node.nil?

       bfs(node.left, &block)
       block.call(node.value)
       bfs(node.right, &block)
   end

end
