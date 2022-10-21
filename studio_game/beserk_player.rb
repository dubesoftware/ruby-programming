require_relative 'player'

class BeserkPlayer < Player
  
  def initialize(name, health)
    super(name, health)
    @woot_count = 0
  end
end