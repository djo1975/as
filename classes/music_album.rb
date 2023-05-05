require_relative 'item'

# MusicAlbum
class MusicAlbum < Item
  attr_accessor :on_spotify, :genres, :author, :album_name

  def initialize(publish_date, on_spotify, genres, author, album_name)
    super(publish_date)
    @on_spotify = on_spotify
    @genres = genres
    @author = author
    @album_name = album_name
  end

  def can_be_archived?
    super && @on_spotify
  end
end
