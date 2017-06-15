require 'gilded_rose'

describe GildedRose do
  describe 'AGED BRIE' do
    context 'when the sell_in is higher than 0' do
      it 'adds one to the quality ' do
        item = [Item.new('Aged Brie', 2, 0)]
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(1)
      end
    end

    context 'when the sell_in date is 0' do
      it 'it increases two quality next day' do
        item = [Item.new('Aged Brie', 0, 0)]
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(2)
      end
    end

    context 'when the value of quality is already 50' do
      it 'it does not increase in value further' do
        item = [Item.new('Aged Brie', 0, 50)]
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(0)
      end
    end
  end

  describe 'BACKSTAGE PASSES' do
    context 'when the sell_in is higher than 11' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 2)]

      it 'the items sell_in drops by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the items quality increases by one' do
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(1)
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
      it 'the quality increases by two' do
        item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)]
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].sell_in
        }.by(-1)
        expect { GildedRose.new(item).update_quality }.to change {
          item[0].quality
        }.by(0)
      end
    end
  end
end
