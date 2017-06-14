require 'gilded_rose'

describe GildedRose do

  describe 'AGED BRIE' do

    context 'when the sell_in is higher than 0' do
      it 'adds one to the quality ' do
        items = [Item.new('Aged Brie', 2, 0)]
        expect { GildedRose.new(items).update_quality }.to change {
          items[0].sell_in
        }.by(-1)
        expect { GildedRose.new(items).update_quality }.to change {
          items[0].quality
        }.by(1)
      end
    end

    context 'when the sell_in date is 0' do

      it 'it increases two quality next day' do
        items = [Item.new('Aged Brie', 0, 0)]
        expect { GildedRose.new(items).update_quality }.to change {
          items[0].sell_in
        }.by(-1)
        expect { GildedRose.new(items).update_quality }.to change {
          items[0].quality
        }.by(2)
        end
      end
    end

  #   it 'does not exceed 50 when updating non Sulfuras item' do
  #     items = [Item.new('Aged Brie', 0, 50)]
  #     expect { GildedRose.new(items).update_quality }.to_not change {
  #       items[0].quality
  #     }.by(1)
  # end
end
