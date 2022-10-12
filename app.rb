require './create_book_module'
require './add_music_genre'
require './game_module'
class App
  include BookLabel
  def menu
    menu_list = ["\nPlease choose an option by entering a number:",
                 '1 - List all books', '2 - List all Music Albums', '3 - List all Games',
                 '4 - List all genres (e.g \'Comedy\', \'Thriller\')',
                 '5 - List all labels (e.g. \'Gift\', \'New\')',
                 '6 - List all authors (e.g. \'Stephen King\')', '7 - Add a book', '8 - Add a music album',
                 '9 - Add a game', "0 - Exit\n\n"]
    menu_list.each do |item|
      puts item
    end
    print 'Option: '
    gets.chomp.to_s
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength:
  def run
    GameModule.load_data
    MusicGenre.load_data
    puts "Welcome to Catalog Of My Things App!\n\n"
    loop do
      num = menu
      case num
      when '1'
        # write your code here
        BookLabel.list_books
      when '2'
        # write your code here8
        MusicGenre.list_music_album
      when '3'
        GameModule.list_games
      when '4'
        # write your code here
        MusicGenre.list_genres
      when '5'
        BookLabel.list_labels
      when '6'
        GameModule.list_authors
      when '7'
        BookLabel.add_book
      when '8'
        # write your code here
        MusicGenre.add_music_album
        MusicGenre.save_data
      when '9'
        GameModule.add_game
      when '0'
        GameModule.save_data
        puts 'Thank you for using this App ...'
        exit
      else
        puts 'Incorrect Input'
        run
      end
    end
  end
  # rubocop: enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
