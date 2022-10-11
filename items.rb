require 'date'

class Items
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date, archived = false)
    @id = Random.rand(1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = Date.parse(publish_date).year
    @current_date = DateTime.now.year
    @archived = archived
  end

  def set_genre(genre)
    @genre = genre
  end

  def set_author(author)
    @author = author
  end

  def set_label(label)
    @label = label
  end

  def move_to_archive
      @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (@current_date - @publish_date) > 10
  end
end

item = Items.new("2014-02-22");
puts item.move_to_archive

