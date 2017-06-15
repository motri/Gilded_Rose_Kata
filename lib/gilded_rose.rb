class GildedRose
  def initialize(items)
    @items = items
  end

  def update_pass(item)
    item.sell_in -= 1
    item.quality = 0 if item.sell_in < 0
    return if item.quality == 0
    return if item.quality == 50
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 5
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
      update_pass(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      update_regular(item) if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
    end
  end
end
