# It understands regular items
class Regular
  attr_accessor :update_regular

  def initialize(item)
    @item = item
  end

  def update_regular
    return if @item.quality.zero?
    @item.quality -= 1
    return if @item.quality.zero?
    @item.quality -= 1 if @item.sell_in <= 0
  end
end
