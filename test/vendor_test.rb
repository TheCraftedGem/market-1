require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require 'pry'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_can_hold_inventory
    expected = {}
    assert_equal expected, @vendor.inventory
  end
  
  def test_it_can_store_stock
    assert_equal 0, @vendor.check_stock("Peaches")
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    assert_equal 55, @vendor.check_stock("Peaches")
  end

  def test_it_can_stock_different_items
    assert_equal 0, @vendor.check_stock("Peaches")
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)
    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, @vendor.inventory
  end
end