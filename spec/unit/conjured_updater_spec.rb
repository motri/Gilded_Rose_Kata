require 'updaters/conjured_updater'
require 'updaters/regular_updater'
require 'item'

describe 'ConjuredUpdater' do
  describe '#update_conjured' do
    context 'when the quality is higher than 0 and sell_in above 0' do
      item = Item.new('Conjured Mana Cake', 3, 6)
      Conjured.new(item).update
      it 'decreases quality by two' do
        expect(item.quality).to eq(4)
      end
    end

    context 'when sell_in is less than 0' do
      item = Item.new('Mana restoring potion', -1, 34)
      Conjured.new(item).update

      it 'decreases the quality by four' do
        expect(item.quality).to eq(30)
      end
    end

    context 'when quality is 0' do
      item = Item.new('Mana restoring potion', -6, 0)
      Conjured.new(item).update

      it 'decreases the quality by four' do
        expect(item.quality).to eq(0)
      end
    end
  end
end
