require_relative 'player'

class BeserkPlayer < Player
  
  def initialize(name, health)
    super(name, health)
    @w00t_count = 0
  end
  
  def berserk?
    @w00t_count > 5
  end
  
  def w00t
    super
    @w00t_count += 1
    if beserk?
      puts("Berserker is berserk!")
    end
  end
end