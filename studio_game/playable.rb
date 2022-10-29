module Playable
  
  def w00t
    @health += 15
    puts "#{self.name} got w00ted!"
  end
  
  def blam
    @health -= 10
    puts "#{self.name} got blammed!"
  end
  
  def strong?
    @health > 100
  end
end