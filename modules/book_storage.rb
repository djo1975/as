require 'json'

module SaveBookData
  def save_book(books)
    save_book = []
    books.each do |book|
      save_book << { 'name' => book.name, 'publisher' => book.publisher, 'publish_date' => book.publish_date,
                     'cover_state' => book.cover_state }
    end

    File.write('./data/books.json', JSON.generate(save_book))
  end

  def save_label(labels)
    save_labels = []
    labels.each do |label|
      save_labels << { 'title' => label.title, 'color' => label.color }
    end

    File.write('./data/labels.json', JSON.generate(save_labels))
  end
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

  def load_labels
    if File.exist?('./data/labels.json')
      labels_json = File.read('./data/labels.json')
      labels_hash = JSON.parse(labels_json)
      labels_hash.map do |label_hash|
        Label.new(label_hash['title'], label_hash['color'])
      end
    else
      []
    end
  end
end
