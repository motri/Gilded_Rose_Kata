class GildedRose
  def initialize(items)
    @items = items
  end

  def update_regular(item)
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0

  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'
      Brie.new(item).update_brie if item.name == 'Aged Brie'
      Pass.new(item).update_pass if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      update_regular(item) if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
    end
  end
end
