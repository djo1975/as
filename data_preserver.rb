require 'json'
def add_book_to_json
    books_array = File.exist?('books.json') ? JSON.parse(File.read('books.json')) : []
    books_array << {book_name: @book_name, book_publisher: @book_publisher, book_publish_date: @book_publish_date, book_cover_state: @book_cover_state}
    File.write('books.json', JSON.pretty_generate(books_array))
  end

  def json_reader(file)
    return [] unless File.exist?("#{file}.json")
  
    File.open("#{file}.json", 'r') do |f|
      data = JSON.parse(f.read)
      books = data.map { |book| Book.new(book['book_name'], book['book_publisher'], book['book_publish_date'], book['book_cover_state']) }
      return data
    end
  end

#   def add_person_to_json
#     person_array = File.exist?('person.json') ? JSON.parse(File.read('person.json')) : []
#     person_array << { id: @id, age: @age, name: @name, parent_permission: @parent_permission }
#     File.write('person.json', JSON.pretty_generate(person_array))
#   end