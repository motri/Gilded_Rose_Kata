require 'conjured'

describe 'Conjured' do
  describe '#update_conjured' do
    context 'when the quality is higher than 0 and sell_in above 0' do
      item = Item.new('Conjured Mana Cake', 3, 6)
      Conjured.new(item).update_conjured
      it 'decreases quality by two' do
        expect(item.quality).to eq(4)
      end
    end

    context 'when quality higher than' do
    end
  end
end
