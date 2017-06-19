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
    item.sell_in -= 1
    Sort.new(item).update_item_by_type
  end
end
