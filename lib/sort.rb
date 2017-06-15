# It sorts the item type
class Sort
  def initialize(item)
    @item = item
  end

  def update_item_by_type
    if item_special
      update_specials
    else
      Regular.new(@item).update_regular
    end
  end

  def item_special
    @item.name =~ /(Brie|passes|Conjured)/
  end

  def update_specials
    Brie.new(@item).update_brie if @item.name =~ /Brie/
    Pass.new(@item).update_pass if @item.name =~ /passes/
    Conjured.new(@item).update_regular if @item.name =~ /Conjured/
  end
end
