require_relative 'music_storage'

module Music
  include SaveData
  include LoadData

  def display_music_albums
    puts 'List of Albums'
    @music_album.each do |album|
      puts "Album Name: #{album.album_name} by #{album.author}"
      puts "Publish Date: #{album.publish_date}"
      puts "On Spotify: #{album.on_spotify}"
      puts "Genres: #{album.genres.map(&:name).join(', ')}"
      puts
    end
  end

  def create_music_album
    puts 'Enter the music publish date: '
    publish_date = gets.chomp

    puts 'Is it on spotify? [y/n]: '
    on_spotify = gets.chomp == 'y'

    puts 'Enter the name of the author: '
    author = gets.chomp

    puts 'Enter the name of the album: '
    album_name = gets.chomp

    genres = []
    loop do
      puts 'Do you want to add a genre? [y/n]:'
      break if gets.chomp == 'n'

      new_genre = create_genre
      genres << new_genre
      save_genre([new_genre])
    end

    @music_album << MusicAlbum.new(publish_date, on_spotify, genres, author, album_name)
    save_music(@music_album)
  end

  def create_genre
    puts 'Enter the genre name: '
    genre_name = gets.chomp
    Genre.new(genre_name)
  end

  def load_genres
    if File.exist?('./data/genres.json')
      genres_json = File.read('./data/genres.json')
      genres_hash = JSON.parse(genres_json)
      genres_hash.map do |genre_hash|
        Genre.new(genre_hash['name'])
      end
    else
      []
    end
  end
end
