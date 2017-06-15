class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'
      Brie.new(item).update_brie if item.name =~ /Brie/
      Pass.new(item).update_pass if item.name =~ /Backstage passes /
      Regular.new(item).update_regular unless item.name =~ /(Brie|Backstage)/
    end
  end
end
