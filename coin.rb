class Coin
  attr_reader :value_in_pence, :name
  attr_accessor :number_needed

  def initialize(name, value_in_pence)
    @name = name
    @value_in_pence = value_in_pence
  end

  # def fits_in?(amount)
  #   @value_in_pence <= amount
  # end

  # def number_needed_in (amount)
  #   amount / @value_in_pence
  # end

  # def remainder_from(amount)
  #   amount % @value_in_pence
  # end

  def process(amount)
    self.number_needed = amount / self.value_in_pence
    amount % self.value_in_pence
  end

end