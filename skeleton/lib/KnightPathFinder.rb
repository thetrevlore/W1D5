require_relative '00_tree_node'


class KnightPathFinder

  def initialize(starting_pos)
    @position = starting_pos
    @visited_positions = [@position]
    # @build_move_tree = PolyTreeNode.new
  end

  def self.valid_moves(pos)
    row = pos[0]
    col = pos[1]
    result = []

      result << [row + 2, col + 1] unless row + 2 > 8 || col + 1 > 8
      result << [row + 2, col - 1] unless row + 2 > 8 || col - 1 < 0
      result << [row - 2, col - 1] unless row - 2 < 0 || col - 1 < 0
      result << [row - 2, col + 1] unless row - 2 < 0 || col + 1 > 8

      result << [row + 1, col + 2] unless col + 2 > 8 || row + 1 > 8
      result << [row + 1, col - 2] unless col + 2 > 8 || row - 1 < 0
      result << [row - 1, col + 2] unless col + 2 < 8 || row + 1 > 8
      result << [row - 1, col - 2] unless col - 2 < 0 || row - 1 < 0

    result
  end

  def new_move_positions(pos)
    new_positions = []
    KnightPathFinder.valid_moves(pos).each do |move|
      unless @visited_positions.include?(move)
        @visited_positions << move
        new_positions << move
      end
    end

    new_positions
  end

  def build_move_tree

  end



end
