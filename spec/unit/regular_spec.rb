require 'regular'

describe 'Regular' do
  describe '#update_regular' do
    context 'when sell_in is higher than 0' do
      item = Item.new('Mana restoring potion', 5, 23)

      it 'decreases sell_in by one' do
        expect { Regular.new(item).update_regular }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'decreases quality by one' do
        expect(item.quality).to eq(22)
      end
    end

    context 'when sell_in is zero or lower' do
      item = Item.new('Mana restoring potion', 0, 23)

      it 'decreases sell_in by one' do
        expect { Regular.new(item).update_regular }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'decreases quality by two' do
        expect(item.quality).to eq(21)
      end
    end

    context 'when quality is alreday 0' do
      item = Item.new('Mana restoring potion', 3, 0)

      it 'decreases sell_in by one' do
        expect { Regular.new(item).update_regular }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'does not decrease quality any further' do
        expect(item.quality).to eq(0)
      end
    end
  end
end
