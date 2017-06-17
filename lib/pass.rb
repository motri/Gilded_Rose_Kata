# It understands pass
class Pass
  attr_accessor :update_pass
  MAX_QUALITY = 50
  def initialize(item)
    @item = item
  end

  def update_pass
    sell_in_expired ? reduce_quality_to_zero : increase_quality
    # meets_constrictions ? raise 'restriction met' : update_quality
  end

  private

  def reduce_quality_to_zero
    @item.quality = 0
  end

  def meets_constrictions
    @item.quality.zero? || @item.quality == MAX_QUALITY
  end

  def increase_quality
    @item.quality += 1
  end

  def sell_in_expired
    @item.sell_in < 0
  end

  def update_quality
    mid_sell_in_range ? increase_quality : 2.times { increase_quality }
  end

  def mid_sell_in_range
    (10..5).cover?(@item.sell_in)
  end
end
