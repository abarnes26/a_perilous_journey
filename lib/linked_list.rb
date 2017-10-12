require_relative "node"
require 'pry'

class LinkedList
  attr_reader :head, :supplies

  def initialize
    @head = nil
    @supplies = {}
  end

  def add_supplies(supply)
    @supplies.merge!(supply) do |key, val1, val2| val1 + val2 end
  end

  def append(name, supply)
    if @head.nil?
      @head = Node.new(name, supply)
    else current_node = @head
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(name, supply)
    end
    add_supplies(supply)
  end

  def prepend(name, supply)
    if @head.nil?
      @head = Node.new(name)
    else head_node = @head
      prepend_node = Node.new(name, supply)
      prepend_node.next_node = head_node
      @head = prepend_node
    end
    add_supplies(supply)
  end

  def insert(place, name, supply)
    current_node = @head
    ((place)-1).times do
      current_node = current_node.next_node
     end
      redirected_node = current_node
      current_node = current_node.next_node
      insert_node = Node.new(name, supply)
      insert_node.next_node = current_node
      redirected_node.next_node = insert_node
      add_supplies(supply)
  end

  def count
    if @head == nil
      count = 0
    else current_node = @head
      count = 1
        until current_node.next_node.nil?
        current_node = current_node.next_node
        count += 1
        end
    end
    count
  end

  def to_string
    families = "The #{@head.surname} family"
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      families += ", followed by the #{current_node.surname} family"
    end
    families + "."
  end

  def find(place, count)
    current_node = @head
    (place).times do
      current_node = current_node.next_node
      end
      families = "The #{current_node.surname} family"
      (count - 1).times do
        current_node = current_node.next_node
        families += ", followed by the #{current_node.surname} family"
      end
    families + "."
  end

  def include?(name)
    current_node = @head
    until current_node.surname == name || current_node.next_node.nil?
      current_node = current_node.next_node
    end
    if current_node.surname == name
      true
    else false
    end
  end

  def determine_the_family_that_dies
    @dead_counter = 0
    current_node = @head
    counter = 0
    until current_node.next_node.nil?
      current_node = current_node.next_node
      @dead_counter += 1
    end
    dead_family = current_node.surname
  end

  def remove_dead_family_from_wagon_train(family)
    current_node = @head
    (@dead_counter - 1).times do
      current_node = current_node.next_node
    end
    if current_node.next_node.nil?
      @head = nil
    else
    current_node.next_node = nil
  end
    "The #{family} family has died from dysentary."
  end

  def pop
    family = determine_the_family_that_dies
    remove_dead_family_from_wagon_train(family)
  end

  def total_supplies
   @supplies
  end

end
