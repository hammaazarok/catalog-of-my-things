require './game'
require './author'
require 'json'

module GameModule
  @games = []
  @authors = []

  def self.file_exist?(filename)
    File.exist? filename
  end

  def self.save_data
    game = @games.map do |game|
      { mulipalyer: game.mulipalyer, last_played_at: game.last_played_at.to_date, publish_date: game.publish_date }
    end
    File.write('data/games.json', JSON.pretty_generate(game))
    author = @authors.map do |author|
      { first_name: author.first_name, last_name: author.last_name }
    end
    File.write('data/authors.json', JSON.pretty_generate(author))
  end

  def self.load_data
    path = 'data/games.json'
    if file_exist?(path)
      games = JSON.parse(File.read(path))
      games.each do |game|
        @games << Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], false)
      end
    else
      puts 'Games.json file does not exist'
    end
    path2 = 'data/authors.json'
    if file_exist?(path2)
      authors = JSON.parse(File.read(path2))
      authors.each do |author|
        @authors << Author.new(author['first_name'], author['last_name'])
      end
    else
      puts 'Authors.json file does not exist'
    end
  end

  def self.add_game
    game_author = add_author
    print 'Is the game mulipalyer (type: "y" for Yes or "n" for No):'
    mulipalyer = gets.chomp.capitalize == 'Y'
    print 'What date is the games\'s last played at (eg. 2020-10-24): '
    last_played_at = gets.chomp.downcase
    print 'Enter the game\'s publish date (eg. 2022-10-24): '
    publish_date = gets.chomp
    game = Game.new(mulipalyer, last_played_at, publish_date, false)
    @games.push(game)
    game_author.add_item(game)
    puts "\n*** Game successfully added ***\n"
  end

  def self.add_author
    print 'Enter the first name: '
    first_name = gets.chomp
    print 'Enter the last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
    author
  end

  def self.list_games
    if @games.empty?
      puts 'No Games added yet'
    else
      @games.each do |game|
        puts "Multiplayer: #{game.mulipalyer}
        Last Played: #{game.last_played_at.to_date}
        Publish date: #{game.publish_date}"
      end
    end
  end

  def self.list_authors
    if @authors.empty?
      puts 'No Author added yet'
    else
      @authors.each do |author|
        puts "First Name: #{author.first_name} Last Name: #{author.last_name}"
      end
    end
  end
end
