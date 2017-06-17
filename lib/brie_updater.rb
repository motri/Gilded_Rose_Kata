# It understands brie
class BrieUpdater
  attr_accessor :update_brie
  MAX_QUALITY = 50

  def initialize(item)
    @item = item
  end

  def update_brie
    return if quality_at_maximum
    sell_in_valid ? update : udpdate_expired
  end

  private

  def quality_at_maximum
    @item.quality == MAX_QUALITY
  end

  def sell_in_valid
    @item.sell_in >= 0
  end

  def update
    @item.quality += 1
  end

  def udpdate_expired
    @item.quality += 2
  end
end
