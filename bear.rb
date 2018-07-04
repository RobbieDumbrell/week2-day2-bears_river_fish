require_relative('river.rb')

class Bear

  attr_reader :name, :type, :stomach

  def initialize(name, type)
    @name = name
    @type = type
    @stomach = [] # should have an empty stomach on creation
  end

  # a bear should be able to take a fish from the river. It should put the fish name into the bear's stomach.
  def take_fish(fish)
    @stomach << fish
  end

# a bear can empty its stomach which means that all the fish inside its stomach are removed.
  def empty_stomach
    while @stomach.length > 0
      @stomach.pop
    end
    return @stomach
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
