require 'conjured'


describe 'Conjured' do
  describe '#update_conjured' do
    context 'when the quality is higher than 0' do
      item = Item.new('Conjured Mana Cake', 3, 6)
      it 'decreases sell_in by one' do
        expect { Conjured.new(item).update_conjured }.to change {
          item.sell_in
        }.by(-1)
      end

      it 'decreases quality by two' do
        expect(item.quality).to eq(4)
      end
    end
  end
end
