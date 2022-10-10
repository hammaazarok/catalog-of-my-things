class Items
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date, archived = false)
    @id = Random.rand(1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
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
    if can_be_archived?
      @archived = true
    end
  end

  private

  def can_be_archived?
    if @publish_date > 10
      true
    else
      false
    end
  end
end
