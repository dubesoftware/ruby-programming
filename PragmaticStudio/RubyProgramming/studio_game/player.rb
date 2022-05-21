class Player
  attr_accessor :name
  attr_reader :health
  
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
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
  
  def strong?
    @health > 100
  end
  
  def name= (new_name)
    @name = new_name.capitalize
  end
  
  def <=>(other)
    other.score <=> score
  end
  
  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end