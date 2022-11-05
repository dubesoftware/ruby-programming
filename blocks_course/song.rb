require_relative 'utilities'
require_relative 'my_enumerable'

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end
  
  def each_filename
    basename = "#{name}-#{artist}".gsub(" ", "-").downcase
    extensions = %w(.mp3 .wav .aac)
    extensions.each { |e| yield basename + e }
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)

class Playlist
  # include Enumerable
  include MyEnumerable
  
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
  
  def each_tagline
    @songs.each { |s| yield "#{s.name} - #{s.artist}" }
  end
  
  def each_by_artist(artist)
    @songs.my_select { |s| s.artist == artist }.each { |s| yield s }
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

puts "Songs where name contains Okie:"
puts separator
okie_songs = playlist.my_select { |song| song.name =~ /Okie/ }
p okie_songs
puts separator

# puts "Songs where name does not contain Okie:"
# puts separator
# non_okie_songs = playlist.reject { |song| song.name =~ /Okie/ }
# p non_okie_songs
# puts separator

# puts "Songs where artist is Hank:"
# puts separator
# p playlist.any? { |song| song.artist == "Hank" }
# p playlist.detect { |song| song.artist == "Hank" }
# puts separator

puts "Properly-formatted song labels:"
puts separator
song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }
p song_labels
puts separator

# puts "Total duration of playlist in minutes:"
# puts separator
# total_duration = playlist.reduce(0) { |sum, song| sum + song.duration }
# puts "#{total_duration} minutes"
# puts separator

puts "Display the tag line of each song in a playlist:"
puts separator
puts playlist.each_tagline { |t| puts t }
# What is going on here? Why are objects being printed out just before the final separator?
puts separator

puts "Play songs in the playlist that were sung by a particular artist:"
puts separator
playlist.each_by_artist("Hank") { |s| s.play }
puts "....or..."
playlist.each_by_artist("Waylon") { |s| s.play }
puts separator

puts "Print each song's file names:"
puts separator
playlist.each { |s| s.each_filename { |fn| puts fn } }
puts separator