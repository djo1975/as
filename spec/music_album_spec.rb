require 'minitest/autorun'
require_relative '../classes/music_album'

# Mock Item class
class Item
  attr_writer :can_be_archived

  def initialize(id, name)
    @id = id
    @name = name
    @can_be_archived = true
  end

  def can_be_archived?
    @can_be_archived
  end
end

class TestMusicAlbum < Minitest::Test
  def setup
    @album = MusicAlbum.new(1, true, true)
  end

  def test_can_be_archived?
    @album.can_be_archived = false
    assert_equal(false, @album.can_be_archived?)
  end

  def test_can_be_archived_with_spotify?
    @album.on_spotify = false
    assert_equal(true, @album.can_be_archived?)
  end

  def test_can_be_archived_with_spotify_and_archived?
    @album.on_spotify = true
    assert_equal(true, @album.can_be_archived?)
  end
end
