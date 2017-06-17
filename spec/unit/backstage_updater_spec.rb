require 'updaters/backstage_updater'
require 'item'

describe 'Backstage' do
  describe '#update' do
    context 'when the sell_in is higher than 11' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 2)
      Backstage.new(item).update

      it 'the items quality increases by one' do
        expect(item.quality).to eq(3)
      end
    end

    context 'when the sell_in is higher than 5 but lower than 11' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 40)
      Backstage.new(item).update

      it 'the quality increases by two' do
        expect(item.quality).to eq(42)
      end
    end

    context 'when the sell_in is lower than 5' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 2)
      Backstage.new(item).update

      it 'the quality increases by three' do
        expect(item.quality).to eq(5)
      end
    end

    context 'when the sell_in is lower than  0' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 2)
      Backstage.new(item).update

      it 'the passes quality drops to 0' do
        expect(item.quality).to eq 0
      end

      it 'quality does not decrease any further' do
        # method is run again to unsure the quality stays the same even after.
        expect { Backstage.new(item).update }.to change {
          item.quality
        }.by(0)
      end
    end

    context 'when the quality is already 50' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)
      Backstage.new(item).update

      it 'quality does not increase further' do
        expect(item.quality).to eq(50)
      end
    end
  end
end
