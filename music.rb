require './items'

class MusicAlbum < Items
  attr_accessor :on_spotify

    def initialize(on_spotify, publish_date, archived: false)
      super(publish_date,archived)
       @on_spotify = on_spotify
    end

   private
   
   def can_be_archived?
       (@current_date - publish_date) > 10 || on_spotify = true
    end
   
end
puts @current_date