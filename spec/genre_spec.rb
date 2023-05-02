require 'minitest/autorun'
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

class TestGenre < Minitest::Test
  def setup
    @genre = Genre.new(1, 'Comedy', [])
    @item = Item.new(1, 'The Hangover')
  end

  def test_add_item
    @genre.add_item(@item)

    assert_includes(@genre.items, @item)
    assert_equal(@genre, @item.genre)
  end
end
