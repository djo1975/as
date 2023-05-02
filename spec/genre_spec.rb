require 'rspec'
require_relative '../classes/genre'

# Mock Item klasa
class Item
  attr_accessor :genre

  def initialize(id, name)
    @id = id
    @name = name
    @genre = nil
  end
end

RSpec.describe Genre do
  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new(1, 'Comedy', [])
      item = Item.new(1, 'The Hangover')
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
