require 'byebug'
class PolyTreeNode

  attr_reader :parent
  attr_accessor :value, :children


  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    @parent.children.delete(self) unless @parent == nil
    @parent = new_parent

    if new_parent
      @parent.children << self unless @parent.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Error" unless child_node.parent
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    unless self.children.empty?
      self.children.each do |kid|

        result = kid.dfs(target_value)
        return result unless result.nil?
      end
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      value_to_check = queue.shift
      return value_to_check if value_to_check.value == target_value

      queue.concat(value_to_check.children) # .each { |kid| queue << kid }
    end

    nil
  end


end
