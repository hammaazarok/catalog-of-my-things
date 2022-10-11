require 'date'
require './items'

class Game < Items
  attr_accessor :mulipalyer, :last_played_at

  def initialize(mulipalyer, last_played_at, publish_date, archived: false)
    super(publish_date, archived)
    @mulipalyer = publisher
    @last_played_at = cover_state
  end

  private

  def can_be_archived?
    (@current_date - publish_date) < 10 || (@current_date - last_played_at) < 2
  end
end
