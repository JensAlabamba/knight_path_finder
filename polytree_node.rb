class PolyTreeNode
    
    attr_reader :value, :parent, :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent.children.delete(self) unless @parent.nil?
        @parent = node
        @parent.children << self unless @parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end
    def remove_child(child_node)
        child_node.parent = nil
        raise 'not a child' if !self.children.include?(child_node)
    end

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target_value)

    queue = [self]

        until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target_value

            queue.concat(current_node.children)
        end
        nil
    end
end 