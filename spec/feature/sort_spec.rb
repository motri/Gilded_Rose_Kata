require 'sort'

describe 'Sort' do
  describe '#sort_item_type' do
    context 'when Aged Brie' do
      it 'uses update_brie method' do
        item = Item.new('Aged Brie', 2, 0)
        expect { Sort.new(item).update_item_by_type }.to change {
          item.quality
        }.by 1
      end
    end
  end
end
