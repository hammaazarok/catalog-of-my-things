class App
  def menu
    menu_list = ["Welcome to Catalog Of My Things App!\n\n", 'Please choose an option by entering a number:',
                 '1 - List all books', '2 - List all Music Albums', '3 - List all Games',
                 '4 - List all genres (e.g \'Comedy\', \'Thriller\')',
                 '5 - List all labels (e.g. \'Gift\', \'New\')',
                 '6 - List all authors (e.g. \'Stephen King\')', '7 - Add a book', '8 - Add a music album',
                 '9 - Add a game', "0 - Exit\n\n"]
    menu_list.each do |item|
      puts item
    end
    gets.chomp.to_s
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    num = menu
    case num
    when '1'
      # write your code here
    when '2'
      # write your code here
    when '3'
      # write your code here
    when '4'
      # write your code here
    when '5'
      # write your code here
    when '6'
      # write your code here
    when '7'
      # write your code here
    when '8'
      # write your code here
    when '9'
      # write your code here
    when '0'
      puts 'Thank you for using this App ...'
      exit
    else
      puts 'Incorrect Input'
      run
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
