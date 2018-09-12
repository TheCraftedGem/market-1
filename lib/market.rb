class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
    @total_inventory = Hash.new(0)
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names_of_vendors = @vendors.map do |vendor|
    vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.keep_if do |vendor|
    vendor.inventory.keys.include?(item)
    end
  end
  

  def sorted_item_list
    sort_list = @vendors.map do |vendor|
    sorted_items = vendor.inventory.keys.sort
    end.flatten.sort
     sort_list.uniq
  end 

  def total_inventory
    woof = @vendors.group_by do |vendor|
      vendor.inventory
    end.flatten
      ook = woof.delete_if do |e|
      e.class != Hash
    end
  end
  
end
