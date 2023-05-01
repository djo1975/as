CREATE TABLE  Item (
    id INT
    genre = VARCHAR(55)
    author = VARCHAR(55)
    source = VARCHAR(55)
    label = VARCHAR(55)
    publish_date = DATE
    archived = BOOLEAN DEFAULT FALSE
    can_be_archived = BOOLEAN DEFAULT
    move_to_archive = BOOLEAN
    add_label INTEGER REFERENCES Label(id),
    add_source INTEGER REFERENCES Source(id),
    add_genre INTEGER REFERENCES Genre(id),
    add_author INTEGER REFERENCES Author(id)
)

class Item
attr_accessor:id,:author,:source, :label,:publish_date, :archived
attr_reader:can_be_archived, :move_to_archive

def initialize(id, author, source, label, publish_date, archived)
@id = id
@author = author
@source = source
@label = label
@publish_date = publish_date
@archived = archived
end

def can_be_archived(publish_date)
super publish_date < 10.years.ago
end
end