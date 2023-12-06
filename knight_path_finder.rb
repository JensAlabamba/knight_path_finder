require_relative 'polytree_node'

class KnightPathFinder

    attr_reader :start_position

    MOVES = {
        [-2, -1]
        [-2, 1]
        [-1, -2]
        [-1, 2]
        [1, -2]
        [1, 2]
        [2, -1]
        [2, 1]
    }

    def self.valid_moves(current_pos)
        valid_moves = []
        cur_x, cur_y = current_pos
        
        MOVES.each do |(x, y)|
            new_position = [cur_x + x, cur_y + y]

            if new_position.all? { |coord| coord.between?(0, 7) }

            valid_moves << new_position
            end
        end
        valid_moves
    end

    def initialize(starting_position)
        @start_position = starting_position
        @coord_positions = [starting_position]
        
        build_move_tree
    end

    def find_path(end_pos)
        end_node = root_node.dfs(end_pos)

        track_path_back(end_node)
        .reverse
        .map(&:value)
    end
   
    private_constant :MOVES

    private

    attr_accessor :root_node, :considered_positions

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_position)

        nodes = [root_node]
            until nodes.empty?
                current_node = nodes.shift

                current_pos = current_node.value
                new_move_positions(current_pos).each do |next_pos|
                    next_node = PolyTreeNode.new(next_pos)
                    current_node.add_child(next_node)
                    nodes << next_node
                end
            end
    end
    
    
end