require_relative 'polytree_node'

class KnightPathFinder

    attr_reader :position, :previous_position, :jumps

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