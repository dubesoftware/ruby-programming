# Bonus Round
class Calculator
  def initialize(first_value, second_value)
    @first_value = first_value
    @second_value = second_value
  end
  
  def add
    @first_value + @second_value
  end
  
  def subtract
    @first_value - @second_value
  end
end

calculator = Calculator.new(20, 11) 
puts calculator.add
puts calculator.subtract