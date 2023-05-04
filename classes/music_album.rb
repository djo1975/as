require_relative 'item'

# MusicAlbum
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    (super == true and @on_spotify == true)
  end
end
