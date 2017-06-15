# It understands conjured objects
class Conjured
  attr_accessor :update_conjured

  def initialize(item)
    @item = item
  end

  def update_conjured
    return if @item.quality.zero?
    @item.quality -= 1 unless @item.quality.zero?
    return if @item.quality.zero?
    @item.quality -= 1 unless @item.quality.zero?
    return if @item.quality.zero?
  end
end
