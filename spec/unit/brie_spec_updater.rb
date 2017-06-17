require 'brie_updater'

describe 'BrieUpdater' do
  describe '#update_brie' do
    context 'when the sell_in is higher than 0' do
      item = Item.new('Aged Brie', 2, 0)
      BrieUpdater.new(item).update_brie
      it 'increases quality by one' do
        expect(item.quality).to eq(1)
      end
    end

    context 'when the sell_in date is 0' do
      item = Item.new('Aged Brie', -1, 0)
      BrieUpdater.new(item).update_brie
      it 'increases quality by two' do
        expect(item.quality).to eq(2)
      end
    end

    context 'when the value of quality is already 50' do
      item = Item.new('Aged Brie', 0, 50)
      BrieUpdater.new(item).update_brie
      it 'does not increase quality any further' do
        expect(item.quality).to eq(50)
      end
    end
  end
end
