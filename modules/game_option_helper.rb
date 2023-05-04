require_relative 'store_author_game'

module GameOptionHelper
  include StoreAuthorGame
  def add_new_game
    game_name = prompt_user('Enter the game name')
    last_play_date = prompt_user('Enter last played date')
    date = prompt_user('Enter publish date')
    game(date, game_name, last_play_date)
  end

  def game(date, game_name, last_play_date)
    Game.new(date, game_name, last_play_date)
  end

  def create_game
    game = add_new_game
    option = prompt_user('Enter [1] to add new author or enter [2] to add available author')
    option = option.to_i
    case option
    when 1
      author = add_new_author
      @authors << author.add_item(game)
      store_author_game
    when 2
      author = add_available_author
      author.add_item(game)
      store_author_game
    end
  end

  def add_available_author
    show_list('Available authors:')
    display_authors
    id = prompt_user('Enter the selected author id')
    id = id.to_i
    @authors.find { |author| author.id == id }
  end

  def add_new_author
    first_name = prompt_user('Enter first name')
    last_name = prompt_user('Enter last name')
    create_author(first_name, last_name)
  end

  def create_author(first_name, last_name)
    Author.new(first_name, last_name)
  end

  def display_authors
    show_list('Authors:')
    show_list('ID    |  First Name   |  Last Name')
    show_list('--------------------------------------')
    @authors.each do |author|
      puts format("%<id>d\t%<first_name>s\t%<last_name>s", id: author.id, first_name: author.first_name,
                                                           last_name: author.last_name)
    end
  end

  def display_games
    puts 'Games:'
    puts '     Name      |     Author'
    puts '--------------------------------'
    @authors.each do |games|
      games.items.each do |game|
        puts format("%<multiplayer>s\t%<first_name>20s", multiplayer: game.multiplayer,
                                                         first_name: game.author.first_name.to_s)
      end
    end
  end

  def prompt_user(label)
    print "#{label}: "
    gets.chomp
  end

  def show_list(label)
    puts label
  end
end
