require 'gilded_rose'

describe GildedRose do
  describe '#update_items for AGED BRIE' do
    context 'when the sell_in is higher than 0' do
      item = [Item.new('Aged Brie', 2, 0)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'increases quality by one' do
        expect(item[0].quality).to eq(1)
      end
    end

    context 'when the sell_in date is 0' do
      item = [Item.new('Aged Brie', -1, 0)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_items }.to change {
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
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'quality does not increase further' do
        expect(item[0].quality).to eq(50)
      end
    end
  end

  describe '#update_items for BACKSTAGE PASSES' do
    context 'when the sell_in is higher than 11' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 2)]

      it 'the items sell_in drops by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the items quality increases by one' do
        expect(item[0].quality).to eq(3)
      end
    end

    context 'when the sell_in is higher than 5 but lower than 11' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 8, 2)]

      it 'decreases the sell_in date by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the quality increases by two' do
        expect(item[0].quality).to eq(4)
      end
    end

    context 'when the sell_in is lower than 5' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 2)]

      it 'the items sell_in decreases by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the quality increases by three' do
        expect(item[0].quality).to eq(5)
      end
    end

    context 'when the sell_in is lower than or equal to 0' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 2)]

      it 'sell_in is still decreased by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'the passes quality drops to 0' do
        expect(item[0].quality).to eq 0
      end

      it 'quality does not decrease any further' do
        # method is run again to unsure the quality stays the same even after.
        expect { GildedRose.new(item).update_items }.to change {
          item[0].quality
        }.by(0)
      end
    end

    context 'when the quality is already 50' do
      item = [Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 50)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'quality does not increase further' do
        expect(item[0].quality).to eq(50)
      end
    end
  end

  describe '#update_items for SULFURAS, HAND OF RAGNAROS' do
    context "Sulfuras's quality and sell_in are never changed" do
      item = [Item.new('Sulfuras, Hand of Ragnaros', 4, 34)]

      it 'does not decrease sell_in' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(0)
      end

      it 'does not change quality' do
        expect(item[0].quality).to eq(34)
      end
    end
  end

  describe '#update_items for REGULAR OBJECTS' do
    context 'when sell_in is higher than 0' do
      item = [Item.new('Mana restoring potion', 5, 23)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'decreases quality by one' do
        expect(item[0].quality).to eq(22)
      end
    end

    context 'when sell_in is zero or lower' do
      item = [Item.new('Mana restoring potion', 0, 23)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'decreases quality by two' do
        expect(item[0].quality).to eq(21)
      end
    end

    context 'when quality is alreday 0' do
      item = [Item.new('Mana restoring potion', 3, 0)]

      it 'decreases sell_in by one' do
        expect { GildedRose.new(item).update_items }.to change {
          item[0].sell_in
        }.by(-1)
      end

      it 'does not decrease quality any further' do
        expect(item[0].quality).to eq(0)
      end
    end
  end
end
