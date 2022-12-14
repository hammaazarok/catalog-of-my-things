require './book'

class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1000)
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    item.label = self
    @items << item
  end
end
