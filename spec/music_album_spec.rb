require 'rspec'
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

RSpec.describe MusicAlbum do
  describe "#can_be_archived?" do
    before do
      @album = MusicAlbum.new(1, true, true)
    end

    it "returns false if `can_be_archived` is set to false" do
      @album.can_be_archived = false
      expect(@album.can_be_archived?).to be false
    end

    it "returns true if `on_spotify` is false" do
      @album.on_spotify = false
      expect(@album.can_be_archived?).to be true
    end

    it "returns true if `on_spotify` is true and `can_be_archived` is true" do
      @album.on_spotify = true
      expect(@album.can_be_archived?).to be true
    end
  end
end
