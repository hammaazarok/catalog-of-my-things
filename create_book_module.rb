require './book'
require './label'
require 'json'

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
    archived = false
    book = Book.new(publisher, cover_state, publish_date, archived)
    @books.push(book)
    book_label.add_items(book)
    puts "\n*** Book successfully added ***\n"
  end

  def self.add_label
    print 'Enter the label title: '
    title = gets.chomp.capitalize
    print 'Enter the label color: '
    color = gets.chomp.capitalize
    label = Label.new(title, color)
    @labels.push(label)
    label
  end

  def self.list_books
    if @books.empty?
      puts 'No book added yet'
    else
      @books.each do |book|
        puts "Publisher: '#{book.publisher}' Cover_state: '#{book.cover_state}' Publish_date: '#{book.publish_date}'"
      end
    end
  end

  def self.list_labels
    if @labels.empty?
      puts 'No label added yet'
    else
      @labels.each do |label|
        puts "Label_title: '#{label.title}' Label_color: '#{label.color}'"
      end
    end
  end

  # Save and load on exit and app start respectively
  def self.file_exist?(filename)
    File.exist? filename
  end

  def self.save
    books = @books.map do |book|
      { publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date }
    end
    # To write label to a file
    File.write('data/books.json', JSON.pretty_generate(books))
    labels = @labels.map do |label|
      { title: label.title, color: label.color }
    end
    File.write('data/labels.json', JSON.pretty_generate(labels))
  end

  def self.load
    book_path = 'data/books.json'
    if file_exist?(book_path)
      books = JSON.parse(File.read(book_path))
      books.each do |book|
        @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'], false)
      end
    else
      puts 'books.json file does not exist'
    end
    label_path = 'data/labels.json'
    if file_exist?(label_path)
      labels = JSON.parse(File.read(label_path))
      labels.each do |label|
        @labels << Label.new(label['title'], label['color'])
      end
    else
      puts 'labels.json file does not exist'
    end
  end
end
