class Pot
  def initialize
    # Integer instance property to store chip count
    @total_chips = 0
  end
  
  def add(chip)
    # Add a chip from a player during a bet
    add_chip(chip)
  end
  
  def chips
    # Return current total chip count
    get_total_chips
  end
  
  def clear
    # Remove all chips
    delete_chips
  end
  
  private
  
    def add_chip(chip)
      @total_chips += 1
    end
  
    def get_total_chips
      @total_chips
    end
    
    def delete_chips
      @total_chips = 0
    end
end

class Player
  def initialize
    # Array to store player's cards
    @hand = Array.new
  end
  
  def get_hand
    # Return size of player's cards
    fetch_hand
  end
  
  def deal(cards)
    # Deal the player a card
    add_cards(cards)
  end
  
  def bet
    # Return a card from player's current hand
    get_card
  end
    
  end
  
  private
  
    def fetch_hand
      @hand.size
    end
    
    def add_card(card)
      @hand << card
    end
    
    def get_card
      @hand.shift
    end
end

class Deck
  def initialize
    shuffle
  end
  
  def select(count)
    @cards.shift(count)
  end
  
  private
  
    def shuffle
      @cards.shuffle!
    end
end

class Game
  def initialize
    @players = []
    @deck = Deck.new
    deal
  end
  
  def play
    bet
    discard
    bet
    terminate
  end
  
  private
  
    def deal
      @players.each{ |player| player.deal(@deck.select(5)) }
    end
    
    def discard      
    end
    
    def bet
    end
    
    def terminate
    end
end
