require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id, :name

  def initialize(multiplayer, last_played_at)
    super(id, name)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_at < 2.years.ago
  end
end
