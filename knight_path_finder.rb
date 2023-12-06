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
    
end