require 'json'

module 
  def create_directory
    return if File.directory?('./data')

    FileUtils.mkdir_p('./data')
  end

  def store_label_book
    labels_temp = []
    @labels.each do |label|
      labels_temp <<
        {
          title: label.title,
          color: label.color,
          Games: label.items.map do |item|
                   {
                     publish_date: item.publish_date,
                     publisher: item.publisher,
                     cover_state: item.cover_state
                   }
                 end
        }
    end
    File.write('./data/label_game.json', []) unless File.exist?('../data/label_game.json')
    save_in_file(labels_temp, './data/label_game.json')
  end

  def load_label_game
    @labels = []
    label_file = './data/label_game.json'
    if File.exist?(label_file)
      file = File.read(label_file)
      JSON
        .parse(file)
        .each do |label|
          @labels << person = create_label(label['title'], label['color'])
          label['Games'].each do |games|
            person.add_item(game(games['publish_date'],
                                 games['publisher'],
                                 games['cover_state']))
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
