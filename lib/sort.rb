# It sorts the item update type
class Sort
  def initialize(item)
    @item = item
  end

  def update_item_by_type
    item_special ? udpdate_special : update_regular
  end

  private

  def item_special
    @item.name =~ /(Brie|passes|Conjured)/
  end

  def udpdate_special
    Module.const_get(@item.name.split.first).new(@item).update
  end

  def update_regular
    RegularUpdater.new(@item).update
  end
end
