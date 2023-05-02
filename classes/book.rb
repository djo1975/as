require './item'

class Book << Item
    attr_accessor :publisher, :cover_state

    def initialize (publisher, cover_state:'')
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
       if super || @cover_state == 'bad'
        true
       else 
        false
       end
    end
end