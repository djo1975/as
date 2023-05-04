require 'json'

module StoreAuthorGame
  def create_directory
    return if File.directory?('./data')

    FileUtils.mkdir_p('./data')
  end

  def store_author_game
    authors_temp = []
    @authors.each do |author|
      authors_temp <<
        {
          first_name: author.first_name,
          last_name: author.last_name,
          Games: author.items.map do |item|
                   {
                     publish_date: item.publish_date,
                     first_name: item.multiplayer,
                     last_played_at: item.last_played_at
                   }
                 end
        }
    end
    File.write('./data/author_game.json', []) unless File.exist?('../data/author_game.json')
    save_in_file(authors_temp, './data/author_game.json')
  end

  def load_author_game
    @authors = []
    author_file = './data/author_game.json'
    if File.exist?(author_file)
      file = File.read(author_file)
      JSON
        .parse(file)
        .each do |author|
          @authors << person = create_author(author['first_name'], author['last_name'])
          author['Games'].each do |games|
            person.add_item(game(games['publish_date'],
                                 games['first_name'],
                                 games['last_played_at']))
          end
        end
    else
      []
    end
  end

  def save_in_file(array, filename)
    return unless File.exist?(filename)

    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(filename, JSON.generate(array, opts))
  end
end
