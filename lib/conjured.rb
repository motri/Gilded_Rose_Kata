class Conjured
  attr_accessor :update_conjured

  def initialize(item)
    @item = item
  end

  def update_conjured
    @item.sell_in -= 1
    @item.quality -= 2 unless @item.quality.zero?
  end
end
