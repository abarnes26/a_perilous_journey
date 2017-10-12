gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require "./lib/node"
require "./lib/linked_list"

class NodeTest < Minitest::Test

   def test_it_has_name
     node = Node.new("Burke")

     assert_equal "Burke", node.surname
   end

   def test_next_node_is_nil
     node = Node.new("Burke")

     assert_nil node.next_node
   end

 end
