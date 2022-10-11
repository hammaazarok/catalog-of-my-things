require './music'

class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1000)
    @name = name
    puts @name
    @items = []
  end

  def add_item(name)
    name.genre = self
    @items << name
  end
end

genre = Genre.new('the last one')
