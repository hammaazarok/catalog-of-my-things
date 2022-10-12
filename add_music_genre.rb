require './genre'
require './music'

module MusicGenre
  @music_albums = []
  @genres = []

  def self.add_music_album
    music_genre = add_genre
    print 'is album on spotify? ("true" or "false"): '
    on_spotify = gets.chomp.downcase
    print 'Enter the album\'s publish date (eg.2022-10-24): '
    publish_date = gets.chomp
    music_album = MusicAlbum.new(on_spotify, publish_date, false)
    @music_albums.push(music_album)
    music_genre.add_items(music_album)
    puts "\n*** music album successfully added ***\n"
  end

  def self.add_genre
    print 'Enter the genre name: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres.push(genre)
    genre
  end

  def self.list_music_album
    if @music_albums.empty?
      puts 'No Music album  added yet'
    else
      @music_albums.each do |music|
        puts "on_spotify: #{music.on_spotify}  Publish date: #{music.publish_date}"
      end
    end
  end

  def self.list_genres
    if @genres.empty?
      puts 'No genre added yet'
    else
      @genres.each do |genre|
        puts "genre name: #{genre.name}"
      end
    end
  end
end
