require 'date'
require './items'

class Game < Items
  attr_accessor :mulipalyer, :last_played_at

  def initialize(mulipalyer, last_played_at, publish_date, _archived)
    super(publish_date)
    @mulipalyer = mulipalyer
    @last_played_at = DateTime.parse(last_played_at)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (@current_date.year - publish_date.year) < 10 || (@current_date.year - last_played_at.year) < 2
  end
end
