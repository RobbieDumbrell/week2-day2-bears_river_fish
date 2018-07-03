require_relative('river.rb')

class Bear

  attr_reader :name, :type, :stomach

  def initialize(name, type)
    @name = name
    @type = type
    @stomach = [] # should have an empty stomach on creation
  end

  # a bear should be able to take a fish from the river. It should put the fish name into the bear's stomach.
  def take_fish(fish_name)
    @stomach << fish_name
  end

  # method for a bear to roar.
  def roar
    return "ROOAAR!"
  end

  # method to count the amount of fish inside the bear's stomach.
  def food_count
    return @stomach.count
  end

end
