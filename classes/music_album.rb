require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :can_be_archived

  def initialize(id, on_spotify, can_be_archived)
    super(id, '')
    @on_spotify = on_spotify
    @can_be_archived = can_be_archived
  end

  def can_be_archived?
    super || (@on_spotify && @can_be_archived)
  end
end
