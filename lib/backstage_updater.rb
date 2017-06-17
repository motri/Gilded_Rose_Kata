# It understands backstage passess update variables
class Backstage
  MAX_QUALITY = 50
  def initialize(item)
    @item = item
  end

  def update
    sell_in_expired ? reduce_quality_to_zero : increase_quality
    meets_constrictions ? return : update_quality
  end

  private

  def reduce_quality_to_zero
    @item.quality = 0
  end

  def meets_constrictions
    @item.quality.zero? || @item.quality == MAX_QUALITY || @item.sell_in >= 11
  end

  def increase_quality
    @item.quality += 1 unless @item.quality == MAX_QUALITY
  end

  def sell_in_expired
    @item.sell_in < 0
  end

  def update_quality
    mid_sell_in_range ? increase_quality : 2.times { increase_quality }
  end

  def mid_sell_in_range
    (5..10).cover?(@item.sell_in)
  end
end
