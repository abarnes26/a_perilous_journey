gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require "./lib/node"
require "./lib/linked_list"

class LinkedListTest < Minitest::Test

  def test_linked_list_initializes_without_nodes
    list = LinkedList.new

    assert_instance_of LinkedList, list
    assert_nil list.head

  end

  def test_it_can_append_one_node
    list = LinkedList.new

    list.append("West", {"pounds of food" => 100})

    assert_instance_of Node, list.head
    assert_equal "West", list.head.surname

  end

  def it_can_append_mulitple_nodes
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    assert_equal "West", list.head.surname
    assert_nil list.head.next_node

    list.append("Rhodes")

    refute_nil list.head.next_node
    assert_equal "Rhodes", list.head.next_node.surname
  end

   def test_it_can_count_nodes
     list = LinkedList.new

     assert_equal 0, list.count

     list.append("West", {"pounds of food" => 100})

     assert_equal 1, list.count

     list.append("Rhodes", {"pounds of food" => 100})
     assert_equal 2, list.count
   end

   def test_it_can_output_one_family_to_string
     list = LinkedList.new
     list.append("West", {"pounds of food" => 100})

     assert_equal "The West family.", list.to_string
   end

  def test_it_can_output_mulitple_familes_to_string
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    list.append("Rhodes", {"pounds of food" => 100})
    list.append("Cohen", {"pounds of food" => 100})

    assert_equal "The West family, followed by the Rhodes family, followed by the Cohen family.", list.to_string
  end

  def test_it_can_prepend_nodes
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    list.append("Rhodes", {"pounds of food" => 100})
    list.prepend("Cohen", {"pounds of food" => 100})

    assert_equal "The Cohen family, followed by the West family, followed by the Rhodes family.", list.to_string
    assert_equal 3, list.count
  end

  def test_it_can_insert_nodes
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    list.append("Rhodes", {"pounds of food" => 100})
    list.append("Cohen", {"pounds of food" => 100})
    list.insert(1, "McKinney", {"pounds of food" => 100})

    assert_equal "The West family, followed by the McKinney family, followed by the Rhodes family, followed by the Cohen family.", list.to_string
    assert_equal 4, list.count
  end

  def test_it_can_find_and_return_nodes
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    list.append("Rhodes", {"pounds of food" => 100})
    list.append("Cohen", {"pounds of food" => 100})
    list.insert(1, "McKinney", {"pounds of food" => 100})

    assert_equal "The McKinney family.", list.find(1, 1)
    assert_equal "The Rhodes family.", list.find(2, 1)
    assert_equal "The McKinney family, followed by the Rhodes family, followed by the Cohen family.", list.find(1, 3)
  end

  def test_if_it_can_tell_if_values_are_included
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    list.append("Rhodes", {"pounds of food" => 100})
    list.append("Cohen", {"pounds of food" => 100})
    list.insert(1, "McKinney", {"pounds of food" => 100})

    assert list.include?("West")
    refute list.include?("Wabash")
  end

  def test_it_can_determine_which_family_dies
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    list.append("Rhodes", {"pounds of food" => 100})
    list.append("Cohen", {"pounds of food" => 100})

    assert_equal "Cohen", list.determine_the_family_that_dies
  end

  def test_if_list_can_pop_nodes
    list = LinkedList.new
    list.append("West", {"pounds of food" => 100})
    list.append("Rhodes", {"pounds of food" => 100})
    list.append("Cohen", {"pounds of food" => 100})
    list.append("McKinney", {"pounds of food" => 100})

    assert_equal 4, list.count
    assert_equal "The McKinney family.", list.find(3, 1)
    assert_equal "The McKinney family has died from dysentary.", list.pop

    assert_equal 3, list.count
    assert_equal "The Cohen family.", list.find(2, 1)
    assert_equal "The Cohen family has died from dysentary.", list.pop
    assert_equal "The Rhodes family has died from dysentary.", list.pop

    assert_equal 1, list.count
    assert_equal "The West family has died from dysentary.", list.pop
    assert_equal 0, list.count
  end

end
