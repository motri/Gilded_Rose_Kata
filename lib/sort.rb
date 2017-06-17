# It sorts the item type
class Sort
  def initialize(item)
    @item = item
  end

  def update_item_by_type
    udpdate_special || update_regular
  end

  private

  def item_special
    @item.name =~ /(Brie|passes|Conjured)/
  end

  def update_regular
    Regular.new(@item).update_regular unless item_special
  end

  def udpdate_special
    BrieUpdater.new(@item).update_brie if @item.name =~ /Brie/
    Pass.new(@item).update_pass if @item.name =~ /passes/
    ConjuredUpdater.new(@item).update_conjured if @item.name =~ /Conjured/
  end
end
