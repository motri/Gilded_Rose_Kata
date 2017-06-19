# It understands regular items update variables
class RegularUpdater
  def initialize(item)
    @item = item
  end

  def update
    return if @item.quality.zero?
    sell_in_expired ? update_fresh : udpdate_expired
  end

  private

  def sell_in_expired
    @item.sell_in >= 0
  end

  def update_fresh
    @item.quality -= 1 unless @item.quality.zero?
  end

  def udpdate_expired
   @item.quality -= 2
   @item.quality = 0 if @item.quality < 0
  end
end
