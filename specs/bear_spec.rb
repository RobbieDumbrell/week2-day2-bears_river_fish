require('minitest/autorun')
require('minitest/rg')
require_relative('../bear.rb')

class TestBear < MiniTest::Test

  # set up a new instance of Bear and River (adding fish to the river) each time.
  def setup
    @barry = Bear.new("Barry", "Grizzly")

    @amazon = River.new("Amazon")

    frank = Fish.new("Frank")
    fred = Fish.new("Fred")
    francesca = Fish.new("Francesca")
    finn = Fish.new("Finn")
    freya = Fish.new("Freya")

    @amazon.add_fish([frank.name, fred.name, francesca.name, finn.name, freya.name])
  end

  # test to check if a bear has a name.
  def test_check_bear_name
    assert_equal("Barry", @barry.name)
  end

  # test to check if a bear has a type.
  def test_check_bear_type
    assert_equal("Grizzly", @barry.type)
  end

  # test to check if a bear has an empty stomach on creation.
  def test_check_bear_stomach_starts_empty
    fish_in_stomach = @barry.stomach
    assert_equal(0, fish_in_stomach.count)
  end

  # test to check if a bear can take a fish from the river. Fish should go into the bear's stomach, and out of the river.
  def test_bear_takes_fish_from_river
    @barry.take_fish("Fred")
    @amazon.remove_fish("Fred")
    assert_equal(["Fred"], @barry.stomach)
    expected_fish_in_river = ["Frank", "Francesca", "Finn", "Freya"]
    assert_equal(expected_fish_in_river, @amazon.fish_in_river)
  end

  # test to check if a bear can roar
  def test_bear_can_roar
    roar_noise = @barry.roar
    assert_equal("ROOAAR!", roar_noise)
  end

  # test to see if a food.count method counts the amount of fish in it's stomach
  def test_bear_food_count
    @barry.take_fish("Fred")
    @amazon.remove_fish("Fred")
    amount_fish_in_stomach = @barry.food_count
    assert_equal(1, amount_fish_in_stomach)
  end

  # test to see if empty_stomach method removes all fish from the bear's stomach.
  def test_bear_empty_stomach
    @barry.take_fish("Fred")
    @amazon.remove_fish("Fred")
    @barry.take_fish("Frank")
    @amazon.remove_fish("Frank")
    assert_equal(2, @barry.food_count)

    @barry.empty_stomach
    assert_equal(0, @barry.food_count)
  end

end
