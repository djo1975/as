require_relative '../classes/book'
require_relative '../classes/label'
require_relative './book_storage'

module BookLabelModule
  include SaveBookData
  include LoadBookData

  def create_book
    puts 'Please write name of the book.'
    book_name = gets.chomp

    puts 'Please write publisher of the book.'
    book_publisher = gets.chomp

    puts 'Please write date of publish of the book.'
    book_publish_date = gets.chomp

    puts 'Please write the cover state of the book? (Good/Standart/Bad)'
    book_cover_state = gets.chomp

    new_book = Book.new(book_name, book_publisher, book_publish_date, book_cover_state)
    @books << new_book
    save_book(@books)

    puts 'Please write title of the label  of the book? (e.g. Gift, New)'
    label_title = gets.chomp

    puts 'Please write the color of the label of the book?'
    label_color = gets.chomp

    label = Label.new(label_title, label_color)
    @labels << label
    save_label(@labels)

    new_book.add_label(label)
  end

  def list_bookss
    if @books.empty?
      puts "There are no books\n\n"
    else
      puts "\n\nBooks:\n"
      @books.each do |book|
        puts "Name: #{book.name} Publisher: #{book.publisher} Cover State: #{book.cover_state}\n"
      end
    end
    puts
  end

  def list_labelss
    if @labels.empty?
      puts "There are no labels\n\n"
    else
      puts "\n\nLabels:\n"
      @labels.each do |label|
        puts "Title: #{label.title} Color: #{label.color}\n"
      end
    end
    puts
  end
end
