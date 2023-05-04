class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = rand(1..2000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(game)
    @items << game
    game.author = self
  end
end
