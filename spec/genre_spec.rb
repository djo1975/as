require 'rspec'
require_relative '../classes/genre'
require_relative '../classes/item'

RSpec.describe Genre do
  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Comedy')
      item = Item.new('The Hangover')
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
