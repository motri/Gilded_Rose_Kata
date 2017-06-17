require_relative 'aged_updater.rb'
require_relative 'conjured_updater.rb'
require_relative 'backstage_updater.rb'
require_relative 'regular_updater.rb'
require_relative 'item.rb'
require_relative 'sort.rb'

# It understands updating items
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_items
    @items.each { |item| update(item) unless item.name =~ /Sulfuras/ }
  end

  private

  def update(item)
    item.sell_in -= 1; Sort.new(item).update_item_by_type
  end
end
