require_relative "linked_list"
require_relative "node"

class Wagon_train < LinkedList
  attr_reader :list, :node

  def initialize
    @list = LinkedList.new
    @supplies = {}
  end

  def append(surname, supply)
    @list.append(surname, supply)
  end

  def count
    @list.count
  end

  def supplies
    @list.total_supplies
  end

  def determine_haul_from_hunting(animal_options)
    haul = []
    number_of_animals = (rand 1..5)
    (number_of_animals).times do
      animal_selection = (rand 1..3)
      if animal_selection == 1
        haul << animal_options["squirrel"]
      elsif animal_selection == 2
        haul << animal_options["deer"]
      elsif animal_selection == 3
        haul << animal_options["bison"]
      end
    end
    haul
  end

  def count_animals_from_hunting(haul)
    @bison_count = haul.count(100)
    @squirrel_count = haul.count(2)
    @deer_count = haul.count(40)
  end

  def return_results_from_hunting_to_user(haul)
    if @squirrel_count == 1
      squirrel_noun = "squirrel"
    else squirrel_noun = "squirrels"
    end
    @total_food_from_hunt = haul.sum
    puts "Congratulations! You bagged #{@squirrel_count} #{squirrel_noun}, #{@bison_count} bison, and #{@deer_count} deer.
      You collected #{@total_food_from_hunt} food."
  end

  def add_food_from_hunt_to_total_supplies(food_from_hunt)
    supplies["pounds of food"] += food_from_hunt
  end

  def go_hunting
      animals = {"squirrel" => 2, "deer" => 40, "bison" => 100}
      haul = determine_haul_from_hunting(animals)
      count_animals_from_hunting(haul)
      return_results_from_hunting_to_user(haul)
      add_food_from_hunt_to_total_supplies(@total_food_from_hunt)
    end

end
