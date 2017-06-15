require 'brie'
require 'item'

describe Brie do
  describe '#update_brie' do
    context 'when the sell_in is higher than 0' do
      item = Item.new('Aged Brie', 2, 0)

      it 'decreases sell_in by one' do
        expect { Brie.new(item).update_brie }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'increases quality by one' do
        expect(item.quality).to eq(1)
      end
    end

    context 'when the sell_in date is 0' do
      item = Item.new('Aged Brie', -1, 0)

      it 'decreases sell_in by one' do
        expect { Brie.new(item).update_brie }.to change {
          item.sell_in
        }.by(-1)
      end
      it 'increases quality by two' do
        expect(item.quality).to eq(2)
      end
    end

    context 'when the value of quality is already 50' do
      item = Item.new('Aged Brie', 0, 50)

      it 'decreases sell_in by one' do
        expect { Brie.new(item).update_brie }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'quality does not increase further' do
        expect(item.quality).to eq(50)
      end
    end
  end
end
