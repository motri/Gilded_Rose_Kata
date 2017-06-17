# It sorts the item type
class Sort
  def initialize(item)
    @item = item
    @type = @item.name.split.first
  end

  def update_item_by_type
    item_special ? udpdate_special : update_regular
  end

  private

  def item_special
    @item.name =~ /(Brie|passes|Conjured)/
  end

  def udpdate_special
    Module.const_get("#{@type}").new(@item).update
  end

  def update_regular
    RegularUpdater.new(@item).update
  end
end
