require('minitest/autorun')
require('minitest/rg')
require_relative('../river.rb')

class TestRiver < MiniTest::Test

  # set up a new instance of River each time.
  def setup
    @amazon = River.new("Amazon")

    @frank = Fish.new("Frank")
    @fred = Fish.new("Fred")
    @francesca = Fish.new("Francesca")
    @finn = Fish.new("Finn")
    @freya = Fish.new("Freya")

    @amazon.add_fish([@frank, @fred, @francesca, @finn, @freya])
  end

  # test to check if river has a name.
  def test_check_river_name
    assert_equal("Amazon", @amazon.name)
  end

  # test to check the river is holding fish with names and add_fish function works
  def test_check_fish_in_river
    expected_fish = [@frank, @fred, @francesca, @finn, @freya]
    assert_equal(expected_fish, @amazon.fish_in_river)
  end

  # test to check the river can remove a fish if a bear eats it.
  def test_remove_fish_from_river
    @amazon.remove_fish_by_name(@francesca)
    expected_fish = [@frank, @fred, @finn, @freya]
    assert_equal(expected_fish, @amazon.fish_in_river)
  end

  # test to check if a fish.count method works.
  def test_fish_count
    number_fish_in_river = @amazon.fish_count
    assert_equal(5, number_fish_in_river)
  end

end
