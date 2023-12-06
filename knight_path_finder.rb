require_relative 'polytree_node'

class KnightPathFinder

    attr_reader :position, :previous_position, :jumps

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
        @position = starting_position
        @previous_position = nil
        @jumps = []
    end

    def previous_position=(node)
        @previous_position.jumps.delete(self) unless @previous_position.nil?
        @previous_position = node
        @previous_position.children << self unless @previous_position.nil?
    end
    
end