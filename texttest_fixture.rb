require_relative './lib/gilded_rose.rb'
require_relative './lib/item.rb'
require_relative './lib/sort.rb'
require_relative './lib/updaters/aged_updater.rb'
require_relative './lib/updaters/backstage_updater.rb'
require_relative './lib/updaters/conjured_updater.rb'
require_relative './lib/updaters/regular_updater.rb'


puts 'OMGHAI!'
items = [
  Item.new('+5 Dexterity Vest', 10, 20),
  Item.new('Aged Brie', 2, 0),
  Item.new('Elixir of the Mongoose', 5, 7),
  Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
  Item.new('Sulfuras, Hand of Ragnaros', -1, 80),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
  Item.new('Conjured Mana Cake', 3, 6)
]

days = 30
days = ARGV[0].to_i + 1 unless ARGV.empty?

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts 'name, sellIn, quality'
  items.each do |item|
    puts item
  end
  puts ''
  gilded_rose.update_items
end
