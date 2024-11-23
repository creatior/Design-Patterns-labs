class Binary_iterator include Enumerable
   def initialize(root)
       @root = root
   end

   def each(&block)
       bfs(@root, &block)
   end

    private

   def bfs(root, &block)
       return if node.nil?

       bfs(node.left, &block)
       yield node.value
       bfs(node.right, &block)
   end

end
