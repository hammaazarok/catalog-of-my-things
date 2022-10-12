require './book'
require './label'

module BookLabel
  @books = []
  @labels = []

  def self.add_book
    book_label = add_label
    print 'Enter the book\'s publisher: '
    publisher = gets.chomp.capitalize
    print 'Enter the book\'s cover state (eg. "good" or "bad"): '
    cover_state = gets.chomp.downcase
    print 'Enter the book\'s publish date (eg.2022-10-24): '
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date, false)
    @books.push(book)
    book_label.add_items(book)
    puts "\n*** Book successfully added ***\n"
  end

  def self.add_label
    print 'Enter the label title: '
    title = gets.chomp
    print 'Enter the label color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels.push(label)
    label
  end

  def self.list_books
    if @books.empty?
      puts 'No book added yet'
    else
      @books.each do |book|
        puts "Publisher: #{book.publisher} Cover state: #{book.cover_state} Publish date: #{book.publish_date}"
      end
    end
  end

  def self.list_labels
    if @labels.empty?
      puts 'No label added yet'
    else
      @labels.each do |label|
        puts "Label title: #{label.title} Label color: #{label.color}"
      end
    end
  end
end
