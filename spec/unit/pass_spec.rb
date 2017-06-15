require 'pass'


describe 'Pass' do
  describe '#update_pass' do
    context 'when the sell_in is higher than 11' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 2)

      it 'the items sell_in drops by one' do
        expect { Pass.new(item).update_pass }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'the items quality increases by one' do
        expect(item.quality).to eq(3)
      end
    end

    context 'when the sell_in is higher than 5 but lower than 11' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 2)

      it 'decreases the sell_in date by one' do
        expect { Pass.new(item).update_pass }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'the quality increases by two' do
        expect(item.quality).to eq(4)
      end
    end

    context 'when the sell_in is lower than 5' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 2)

      it 'the items sell_in decreases by one' do
        expect { Pass.new(item).update_pass }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'the quality increases by three' do
        expect(item.quality).to eq(5)
      end
    end

    context 'when the sell_in is lower than or equal to 0' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 2)

      it 'sell_in is still decreased by one' do
        expect { Pass.new(item).update_pass }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'the passes quality drops to 0' do
        expect(item.quality).to eq 0
      end

      it 'quality does not decrease any further' do
        # method is run again to unsure the quality stays the same even after.
        expect { Pass.new(item).update_pass }.to change {
          item.quality
        }.by(0)
      end
    end

    context 'when the quality is already 50' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)

      it 'decreases sell_in by one' do
        expect { Pass.new(item).update_pass }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'quality does not increase further' do
        expect(item.quality).to eq(50)
      end
    end
  end
end
