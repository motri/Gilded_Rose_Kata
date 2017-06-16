# It sorts the item type
class Sort
  def initialize(item)
    @item = item
  end

  def update_item_by_type
    Brie.new(@item).update_brie if @item.name =~ /Brie/
    Pass.new(@item).update_pass if @item.name =~ /passes/
    Conjured.new(@item).update_regular if @item.name =~ /Conjured/
    Regular.new(@item).update_regular unless item_special
  end

  def item_special
    @item.name =~ /(Brie|passes|Conjured)/
  end

end
