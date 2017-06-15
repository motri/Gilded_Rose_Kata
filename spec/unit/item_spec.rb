require 'item'

describe 'Item' do
  describe '#to_s' do
    it 'turns the items attributes into a string' do
      item = Item.new('Mana restoring potion', 0, 23)
      expect(item.to_s).to eq('Mana restoring potion, 0, 23')
    end
  end
end
