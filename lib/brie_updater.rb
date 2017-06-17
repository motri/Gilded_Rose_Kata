# It understands brie
class BrieUpdater
  attr_accessor :update_brie
  MAX_QUALITY = 50

  def initialize(item)
    @item = item
  end

  def update_brie
    return if @item.quality == MAX_QUALITY
    sell_in_current? || sell_in_expired?
  end

  def sell_in_expired?
    @item.quality += 2 if @item.sell_in <= 0
  end

  def sell_in_current?
    @item.quality += 1 if @item.sell_in >= 0
  end
end
