require 'updaters/regular_updater'
require 'item'

describe 'RegularUpdater' do
  describe '#update_regular' do
    context 'when sell_in is higher than 0' do
      item = Item.new('Mana restoring potion', 5, 23)
      RegularUpdater.new(item).update

      it 'decreases quality by one' do
        expect(item.quality).to eq(22)
      end
    end

    context 'when sell_in is lower than zero' do
      item = Item.new('Mana restoring potion', -1, 23)
      RegularUpdater.new(item).update

      it 'decreases quality by two' do
        expect(item.quality).to eq(21)
      end
    end

    context 'when quality is alreday 0' do
      item = Item.new('Mana restoring potion', 3, 0)
      RegularUpdater.new(item).update

      it 'does not decrease quality any further' do
        expect(item.quality).to eq(0)
      end
    end
  end
end
