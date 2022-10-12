require './items'

class MusicAlbum < Items
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date, _archived)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    (@current_date - publish_date) < 10 || on_spotify = 'true'
  end
end
music = MusicAlbum.new('true', '2020-10-24', false)
