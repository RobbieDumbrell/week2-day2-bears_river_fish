require('minitest/autorun')
require('minitest/rg')
require_relative('../fish.rb')

class TestFish < MiniTest::Test

  # set up a new instance of Fish each time.
  def setup
    @fred = Fish.new("Fred")
  end

  # test to check if the fish has a name.
  def test_check_fish_name
    assert_equal("Fred", @fred.name)
  end

end
