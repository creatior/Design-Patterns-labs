class Node
   attr_accessor :value, :left, :right, :parent

    def initialize(value:nil, left:nil, right:nil, parent:nil)
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
    end

end
