class Player
  attr_accessor :name
  attr_reader :health
  
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end
  
  def to_s
    "I'm #{name} with a health of #{health} and a score of #{score}."
  end
  
  def blam
    @health -= 10
    puts "#{name} got blammed!"
  end
  
  def w00t
    @health += 15
    puts "#{name} got w00ted!"
  end
  
  def score
    @health + @name.length
  end
  
  def name= (new_name)
    @name = new_name.capitalize
  end
end

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play
    puts "There are #{@players.size} players in #{title}:"
    puts @players
    @players.each do |player|
      player.blam
      2.times do
        player.w00t
      end
      puts player
    end
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
players = [player1, player2, player3]

knuckleheads = Game.new("Knuckleheads")
players.each do |player|
  knuckleheads.add_player(player)
end
knuckleheads.play