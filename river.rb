require_relative('fish.rb')

class River

  attr_reader :name, :fish_in_river

  def initialize(name)
    @name = name

    # so every time a new River instance is created, there are no fish, but we need to add fish to river via add_fish method
    @fish_in_river = []
  end

  # function to add fish to river, takes an array of fish names
  def add_fish(fish_array)
    @fish_in_river << fish_array
    @fish_in_river.flatten!
  end

  # function to remove a fish from the river by name.
  def remove_fish(fish_name)
    @fish_in_river.delete(fish_name)
  end

  # function to count fish in the river.
  def fish_count
    return @fish_in_river.count
  end

end
