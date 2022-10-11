require 'date'

class Items
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = Date.parse(publish_date).year
    @current_date = DateTime.now.year
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (@current_date - @publish_date) > 10
  end
end
