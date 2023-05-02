require 'active_support/core_ext/numeric/time'
require './book'


# This class represents a label and its associated item
class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(metadata)
    @id = metadata.id
    @genre = metadata.genre
    @author = metadata.author
  end

  def self.create(metadata, label: nil, publish_date: nil, archived: false)
    item = Item.new(metadata)
    item.label = label if label
    item.publish_date = publish_date if publish_date
    item.archived = archived if archived
    item
  end


  def can_be_archived?

    publish_date < 10.years.ago
  end

  def move_to_archive
    self.archived = can_be_archived
  end
end

# This class represents a label and its associated item
class MetaData
  attr_accessor :id, :genre, :author

  def initialize(id:, genre:, author:)
    @id = id
    @genre = genre
    @author = author
  end
end
