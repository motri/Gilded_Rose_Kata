# It understands regular items
class RegularUpdater

  def initialize(item)
    @item = item
  end

  def update
    return if @item.quality.zero?
    sell_in_valid ? update_fresh : udpdate_expired
  end

  private

  def sell_in_valid
    @item.sell_in >= 0
  end

  def update_fresh
    @item.quality -= 1 unless @item.quality.zero?
  end

  def udpdate_expired
    2.times { @item.quality -= 1 unless @item.quality.zero? }
  end
end
