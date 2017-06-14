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
        it 'the quality increases by one' do
          item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 2)]
          expect { GildedRose.new(item).update_quality }.to change {
            item[0].sell_in
          }.by(-1)
          expect { GildedRose.new(item)}
        end
      end
    end


end
