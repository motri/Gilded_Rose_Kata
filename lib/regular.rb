class Regular
  attr_accessor :update_regular

  def initialize(item)
    @item = item
  end

  def update_regular
    @item.sell_in -= 1
    return if @item.quality == 0
    @item.quality -= 1
    @item.quality -= 1 if @item.sell_in <= 0
  end
end
