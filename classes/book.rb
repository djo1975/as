require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :id, :name

  def initialize(publisher, cover_state = '')
    @publisher = publisher
    @cover_state = cover_state
    super(id, name)
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
