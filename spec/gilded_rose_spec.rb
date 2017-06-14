require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'changes sell_in for the recognised items' do
      items = [Item.new('Aged Brie', 0, 0)]
      expect { GildedRose.new(items).update_quality }.to change {
        items[0].sell_in
      }.by(-1)
    end
  end
end
