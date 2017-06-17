# It understands updating items params
require_relative 'brie.rb'
require_relative 'conjured.rb'
require_relative 'pass.rb'
require_relative 'regular.rb'
require_relative 'item.rb'
require_relative 'sort.rb'



class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'
      item.sell_in -= 1
      Sort.new(item).update_item_by_type
    end
  end
end
