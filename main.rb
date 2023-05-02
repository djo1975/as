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

def main
  loop do
    run
    option = gets.chomp.to_i
    option(option)
  end
end

main
