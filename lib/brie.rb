# It understands brie
class Brie
  attr_accessor :update_brie

  def initialize(item)
    @item = item
  end

  def update_brie
    @item.sell_in -= 1
    return if @item.quality == 50
    @item.quality += 1
    @item.quality += 1 if @item.sell_in <= 0
  end
end
