# It understands conjured objects update variables
class Conjured
  def initialize(item)
    @item = item
  end

  def update
    2.times { RegularUpdater.new(@item).update }
  end
end
