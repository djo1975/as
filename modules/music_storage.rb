require 'json'

module SaveData
  def save_music(musics)
    save_music = []
    musics.each do |music|
      genres = music.genres.map(&:name)
      save_music << {
        'publish_date' => music.publish_date,
        'on_spotify' => music.on_spotify,
        'author' => music.author,
        'album_name' => music.album_name,
        'genres' => genres
      }
    end

    File.write('./data/musics.json', JSON.generate(save_music))
  end

  def save_genre(genres)
    current_genres = load_genres
    current_genres += genres

    save_genres = []
    current_genres.each do |genre|
      save_genres << { 'name' => genre.name }
    end

    File.write('./data/genres.json', JSON.generate(save_genres))
  end
end

module LoadData
  def load_musics
    if File.exist?('./data/musics.json')
      musics_json = File.read('./data/musics.json')
      musics_hash = JSON.parse(musics_json)
      musics_hash.map do |music_hash|
        genres = music_hash['genres'].map { |genre| Genre.new(genre) }
        MusicAlbum.new(
          music_hash['publish_date'],
          music_hash['on_spotify'],
          genres,
          music_hash['author'],
          music_hash['album_name']
        )
      end
    else
      []
    end
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
