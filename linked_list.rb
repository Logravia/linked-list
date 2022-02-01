#!/usr/bin/env ruby
require 'pry-byebug'

class Node
  attr_accessor :data, :next_node
  def initialize(data=nil)
    @data = data
    @next_node = nil
  end
  def last?
    return @next_node.nil?
  end
end

class LinkedList
  attr_reader :size
  def initialize
    @head = Node.new
    @size = 0
  end
  def append(data)
    cur_node = head
    until cur_node.last?
      cur_node = cur_node.next_node
    end
    cur_node.next_node = Node.new(data)
    @size += 1
  end
  def prepend(data)
    former_first_node = head.next_node
    head.next_node = Node.new(data)
    cur_first_node = head.next_node
    cur_first_node.next_node = former_first_node
    @size += 1
  end
  def head
    head.next_node
  end
  def tail
    return nil if head.next_node.nil?
    cur_node = head
    until cur_node.next_node.nil?
      cur_node = cur_node.next_node
    end
    cur_node
  end
  def to_s
    string = ''
    self.each { |data,_n| string += "(#{data})-> "}
    string + 'nil'
  end
  def at(index)
    if (index < 0 or
        not index.kind_of? Integer or
        index > size)
      return nil
    end

    cur_node = head.next_node
    cur_index = 0
    while cur_index < index and not cur_node.next_node.nil?
      cur_node = cur_node.next_node
      cur_index =+ 1
    end
    cur_node
  end
  def pop
    return nil if head.last?
    cur_node = head.next_node
    prev_node = head
    while not cur_node.last?
      prev_node = cur_node
      cur_node = cur_node.next_node
    end
    prev_node.next_node = nil
  end
  def contains(value)
    self.each do |data, _n|
      if data == value
        return true
      end
    end
    false
  end
  def find(to_find)
    cur_index = 0
    self.each do |data, _n|
      return cur_index if data == to_find
      cur_index += 1
    end
    nil
  end
  private
  attr_accessor :head
  def each
    return if head.last?

    cur_node = head.next_node
    yield(cur_node.data, cur_node.next_node)

    while not cur_node.last?
      cur_node = cur_node.next_node
      yield(cur_node.data, cur_node.next_node)
    end

  end
end

list = LinkedList.new
list.append("First node")
list.append("Second node")
list.prepend("Zeroth node")
pp list
puts list.to_s
#pp list.head
#pp list.tail
#pp list.size
