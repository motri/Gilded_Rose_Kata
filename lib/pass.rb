# It understands pass
class Pass
  attr_accessor :update_pass

  def initialize(item)
    @item = item
  end

  def update_pass
    @item.sell_in -= 1
    @item.quality = 0 if @item.sell_in < 0
    return if @item.quality.zero?
    return if @item.quality == 50
    @item.quality += 1
    @item.quality += 1 if @item.sell_in < 11
    @item.quality += 1 if @item.sell_in < 5
  end
end
