# It understands brie
class Brie
  attr_accessor :update_brie
  MAX_QUALITY = 50

  def initialize(item)
    @item = item
  end

  def update_brie
    return if @item.quality == MAX_QUALITY
    @item.quality += 1
    @item.quality += 1 if @item.sell_in <= 0
  end
end
