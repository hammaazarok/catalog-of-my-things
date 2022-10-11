require './items'
require 'pry'

class Book < Items
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived = false)
    super(publish_date, archived = false)
    @publisher = publisher
    @cover_state = cover_state
  end



  private

  def can_be_archived?
    (@current_date  - publish_date) < 10  || cover_state == 'bad' ? true : false
  end
end

book = Book.new("Scribe", "good", "2008/09/13")

puts book.can_be_archived?