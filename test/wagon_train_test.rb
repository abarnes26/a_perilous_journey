gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require "./lib/node"
require "./lib/linked_list"
require "./lib/wagon_train"

 class WagonTrainTest < Minitest::Test

   def test_if_it_instantiates
     wt = Wagon_train.new

     assert_instance_of Wagon_train, wt
   end

   def test_if_you_can_access_list_class
     wt = Wagon_train.new

     assert_instance_of LinkedList, wt.list
   end

   def test_it_can_access_list_head
     wt = Wagon_train.new

     assert_nil wt.list.head
   end

   def test_it_can_append_new_nodes
     wt = Wagon_train.new
     wt.append("Burke", {"pounds of food" => 100})

     assert_equal "Burke", wt.list.head.surname
   end

   def test_if_it_can_append_multiple_nodes
     wt = Wagon_train.new
     wt.append("Burke", {"pounds of food" => 100})
     wt.append("West", {"pounds of food" => 100})

     assert_equal "West", wt.list.head.next_node.surname
     assert_equal 2, wt.count
   end

   def test_if_wagons_can_carry_supplies
     wt = Wagon_train.new
     wt.append("Burke", {"pounds of food" => 100})
     wt.append("West", {"pounds of food" => 200})
     wt.append("Cohen", {"extra wheels" => 2})

     assert_equal 3, wt.count
     assert_equal ({"pounds of food"=>300, "extra wheels"=>2}), wt.supplies
   end

   def test_if_hunting_populates_the_haul
     wt = Wagon_train.new
     animals = {"squirrel" => 2, "deer" => 40, "bison" => 100}
     haul = wt.determine_haul_from_hunting(animals)

     refute_nil haul

   end

   def test_if_going_hunting_adds_food_to_supplies
     wt = Wagon_train.new
     wt.append("Burke", {"pounds of food" => 0})

     assert_equal ({"pounds of food" => 0}), wt.supplies

     wt.go_hunting

     refute_equal ({"pounds of food" => 0}), wt.supplies
   end

 end
