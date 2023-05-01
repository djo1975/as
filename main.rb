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

def option(option)
  case option
  when 1
    list_books
  when 2
    list_music_albums
  when 3
    list_games
  when 4
    list_generes
  when 5
    list_labels
  when 6
    list_authors
  when 7
    add_book
  when 8
    add_music_album
  when 9
    add_game
  when 10
    exit
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
