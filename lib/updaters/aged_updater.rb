# It understands aged brie update variables
class Aged
  MAX_QUALITY = 50

  def initialize(item)
    @item = item
  end

  def update
    return if quality_at_maximum
    sell_in_expired ? update_fresh : update_expired
  end

  private

  def quality_at_maximum
    @item.quality == MAX_QUALITY
  end

  def sell_in_expired
    @item.sell_in >= 0
  end

  def update_fresh
    @item.quality += 1
  end

  def update_expired
    @item.quality += 2
  end
end
