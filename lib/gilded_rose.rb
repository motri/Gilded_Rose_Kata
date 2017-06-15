# It understands updating items params
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
