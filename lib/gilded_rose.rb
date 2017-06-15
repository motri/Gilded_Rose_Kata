class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'
      Brie.new(item).update_brie if item.name == 'Aged Brie'
      Pass.new(item).update_pass if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      Regular.new(item).update_regular if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
    end
  end
end
