class Coin
  attr_reader :value_in_pence, :name
  attr_accessor :stock, :number_needed

  def initialize(name, value_in_pence, stock)
    @name = name
    @value_in_pence = value_in_pence
    @stock = stock
  end

  def process(value)
    if ((value/self.value_in_pence) >= self.stock)
      self.number_needed = self.stock
      remainder = value - (self.stock*self.value_in_pence)
    else
      self.number_needed = value / self.value_in_pence
      remainder = value % self.value_in_pence
    end
    remainder
  end
end