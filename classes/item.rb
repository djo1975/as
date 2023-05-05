require 'active_support/all'

class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(date)
    @publish_date = date
    @id = rand(1..2000)
    @archived = false
  end

  def add_label(label)
    @label = label
  end

  def can_be_archived?
    @publish_date < 10.years.ago
  end

  def move_to_archive
    self.archived = can_be_archived?
  end
end
