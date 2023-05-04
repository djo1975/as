require 'json'

module SaveBookData
  def save_book(book)
    save_book = []
    books.each do |book|
      save_book << { 'name' => book.name, 'publisher' => book.publisher, 'publish_date' => book.publish_date, 'cover_state' => book.cover_state }
    end

    File.write('./data/books.json', JSON.generate(save_book))
  end

  #   def save_genre(genres)
  #     save_genres = []
  #     genres.each do |genre|
  #       save_genres << { 'name' => genre.name }
  #     end

  #     File.write('./data/genres.json', JSON.generate(save_genres))
  #   end
end

module LoadBookData
  def load_books
    if File.exist?('./data/books.json')
      books_json = File.read('./data/books.json')
      books_hash = JSON.parse(books_json)
      books_hash.map do |book_hash|
        Book.new(book_hash['name'], book_hash['publisher'], book_hash['publish_date'], book_hash['cover_state'])
      end
    else
      []
    end
  end

  #   def load_genres
  #     if File.exist?('./data/genres.json')
  #       genres_json = File.read('./data/genres.json')
  #       genres_hash = JSON.parse(genres_json)
  #       genres_hash.map do |genre_hash|
  #         Genre.new(genre_hash['name'])
  #       end
  #     else
  #       []
  #     end
  #   end
end
