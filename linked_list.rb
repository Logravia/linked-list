#!/usr/bin/env ruby
require 'pry-byebug'

class Node
  attr_accessor :data, :next_node
  def initialize(data=nil)
    @data = data
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = Node.new
  end
  def append(data)
    cur_node = head
    until cur_node.next_node.nil?
      cur_node = cur_node.next_node
    end
    cur_node.next_node = Node.new(data)
  end
  def prepend(data)
    former_first_node = head.next_node
    head.next_node = Node.new(data)
    cur_first_node = head.next_node
    cur_first_node.next_node = former_first_node
  end
  def to_s
    cur_node = head
    until cur_node.nil?
      print("(#{cur_node.data}) -> ")
      cur_node = cur_node.next_node
    end
      puts("nil")
  end
  private
  attr_reader :head
end

list = LinkedList.new
list.append("First node")
list.append("Second node")
list.prepend("Zeroth node")
list.to_s
