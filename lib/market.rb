class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include? item
    end
  end

  def total_inventory
    hash = Hash.new(0)
    @vendors.map do |vendor|
      vendor.inventory.each do |item, amount|
        hash[item] += amount
      end
    end
    hash
  end

  def sorted_item_list
    total_inventory.keys.sort
  end
end
