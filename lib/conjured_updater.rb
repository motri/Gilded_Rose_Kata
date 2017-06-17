# It understands conjured objects
class ConjuredUpdater
  attr_accessor :update_conjured

  def initialize(item)
    @item = item
  end

  def update_conjured
    return if @item.quality.zero?
    if @item.sell_in >= 0
      2.times do
        @item.quality -= 1 unless @item.quality.zero?
      end
    else
      4.times do
        @item.quality -= 1 unless @item.quality.zero?
      end
    end
  end
end
