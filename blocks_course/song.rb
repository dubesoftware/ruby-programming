require_relative 'utilities'

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)

class Playlist
  include Enumerable
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def each
    @songs.each do |s|
      puts "Yielding #{s.name}..."
      yield s
    end
  end

  def add_song(song)
    @songs << song
  end
  
  def play_songs
    @songs.each { |s| s.play }
  end
end

separator = Utilities::separator

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

puts separator
puts "Play songs using each method:"
puts separator
playlist.each { |s| s.play }
puts separator

puts "Play songs using play_songs method:"
puts separator
playlist.play_songs
puts separator

okie_songs = playlist.select { |song| song.name =~ /Okie/ }
p okie_songs