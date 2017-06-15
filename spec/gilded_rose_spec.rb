require 'gilded_rose'

describe GildedRose do
  describe '#update_quality for AGED BRIE' do

    context 'when the sell_in is higher than 0' do
      item = [Item.new('Aged Brie', 2, 0)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'increases quality by one' do
        expect(item[0].quality).to eq(1)
      end
    end

    context 'when the sell_in date is 0' do
      item = [Item.new('Aged Brie', 0, 0)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end
      it 'increases quality by two' do
        expect(item[0].quality).to eq(2)
      end
    end

    context 'when the value of quality is already 50' do
      item = [Item.new('Aged Brie', 0, 50)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'quality does not increase further' do
        expect(item[0].quality).to eq(50)
      end
    end
  end

  describe '#update_quality for BACKSTAGE PASSES' do

    context 'when the sell_in is higher than 11' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 2)]

      it 'the items sell_in drops by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the items quality increases by one' do
        expect(  item[0].quality).to eq(3)
      end
    end

    context 'when the sell_in is higher than 5 but lower than 11' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 2)]

      it 'decreases the sell_in date by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the quality increases by two' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(2)
      end
    end

    context 'when the sell_in is lower than 5' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 2)]

      it 'the items sell_in decreases by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the quality increases by two' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(3)
      end
    end

    context 'when the sell_in is lower than or equal to 0' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 2)]

      it 'sell_in is still decreased by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the passes quality drops to 0' do
        GildedRose.new(item).update_quality
        expect(item[0].quality).to eq 0
      end

      it 'quality does not decrease any further' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(0)
      end
    end

    context 'when the quality is already 50' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'quality does not increase further' do
        expect(item[0].quality).to eq 50
      end
    end
  end
end
