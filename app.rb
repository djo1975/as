require_relative 'modules/game_option_helper'
require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'classes/genre'
require_relative './modules/music_album'
require_relative './classes/music_album'

class App
  include GameOptionHelper
  include Music
  def initialize
    load_author_game
    @music_album = load_musics
    @genres = load_genres
  end

  def run
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
  end

  OPTIONS = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_games,
    4 => :list_genres,
    5 => :list_labels,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    10 => :exit
  }.freeze

  def option(option)
    method_name = OPTIONS[option]
    if method_name
      send(method_name)
    else
      puts 'Invalid option, please type correct number!'
    end
  end

  def list_games
    display_games
  end

  def list_authors
    display_authors
  end

  def add_game
    create_game
  end

  def add_music_album
    create_music_album
  end

  def list_music_albums
    display_music_albums
  end

  def list_genres
    display_genres
  end
end
