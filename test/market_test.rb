require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'
require 'pry'

class MarketTest < Minitest::Test

  def test_it_exists
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
  end

  def test_market_has_name
    
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", market.name
  end

  def test_it_holds_vendors
    
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal [], market.vendors
  end

  def test_it_can_add_vendors
    
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    expected = [vendor_1, vendor_2, vendor_3]
    assert_equal expected, market.vendors
  end

  def test_vendors_names
    
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, market.vendor_names
  end

 def test_find_vendors_that_sell
  
  vendor_1 = Vendor.new("Rocky Mountain Fresh")
  vendor_1.stock("Peaches", 35)
  vendor_1.stock("Tomatoes", 7)
  vendor_2 = Vendor.new("Ba-Nom-a-Nom")
  vendor_2.stock("Banana Nice Cream", 50)
  vendor_2.stock("Peach-Raspberry Nice Cream", 25)
  vendor_3 = Vendor.new("Palisade Peach Shack")
  vendor_3.stock("Peaches", 65) 
  market = Market.new("South Pearl Street Farmers Market")
  market.add_vendor(vendor_1)
  market.add_vendor(vendor_2)
  market.add_vendor(vendor_3)
  expected = [vendor_1, vendor_3]
  assert_equal expected, market.vendors_that_sell("Peaches")
  end

  def test_find_vendors_that_sell_something_different
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    expected = [vendor_2]
    assert_equal expected, market.vendors_that_sell("Banana Nice Cream")
  end

  def test_it_can_sort_uniq_list
    
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]
    assert_equal expected, market.sorted_item_list
  end

  def test_total_market_inventory
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    expected = {"Peaches"=>100, "Tomatoes"=>7, "Banana Nice Cream"=>50, "Peach-Raspberry Nice Cream"=>25}
    assert_equal expected, market.total_inventory
  end
end