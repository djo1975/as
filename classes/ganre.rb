require_relative 'item'
# This class represents a genre and its associated items.
class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name, items)
    @id = id
    @name = name
    @items = items[]
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
