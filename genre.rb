require './music'

class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1000)
    @name = name
    @items = []
  end

  def add_items(item)
     item.genre = self
    @items << item
   
  end
end
