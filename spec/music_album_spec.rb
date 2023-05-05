require 'date'
require_relative '../classes/music_album'

describe MusicAlbum do
  let(:publish_date) { Date.parse('2021-01-01') }
  let(:album) { MusicAlbum.new(publish_date, true, %w[pop rock], 'John Doe', 'My Album') }

  describe '#can_be_archived?' do
    context 'when the album is on Spotify and the publish date is more than 5 years ago' do
      it 'returns true' do
        publish_date = Date.parse('2015-01-01')
        album = MusicAlbum.new(publish_date, true, %w[pop rock], 'John Doe', 'My Album')
        expect(album.can_be_archived?).to eq false
      end
    end

    context 'when the album is not on Spotify' do
      let(:album) { MusicAlbum.new(publish_date, false, %w[pop rock], 'John Doe', 'My Album') }

      it 'returns false' do
        expect(album.can_be_archived?).to eq false
      end
    end

    context 'when the publish date is less than 5 years ago' do
      let(:publish_date) { Date.parse('2022-01-01') }

      it 'returns false' do
        expect(album.can_be_archived?).to eq false
      end
    end
  end
end
