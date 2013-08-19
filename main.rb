require_relative 'coin'
require 'pry'




two_pound = Coin.new("Two Pound coin",200)
one_pound = Coin.new("One Pound coin",100)
fifty_pence = Coin.new("50p piece", 50)
twenty_pence = Coin.new("20p piece", 20)
ten_pence = Coin.new("10p piece",10)
five_pence = Coin.new("5p piece", 5)
two_pence = Coin.new("2p piece", 2)
one_pence = Coin.new("1p piece", 1)

available_coins = [
  two_pound,
  one_pound,
  fifty_pence,
  twenty_pence,
  ten_pence,
  five_pence,
  two_pence,
  one_pence
]


def get_amount(string)
  puts "Enter #{string}"
  gets.chomp.downcase.to_i
end


available_coins = available_coins.sort_by {|coin| coin.value_in_pence}.reverse




def calculate_change(change_needed, available_coins)
  change_array = available_coins.inject(change_needed){ |remainder, coin| coin.process(remainder)}
  available_coins.each{|coin| puts "#{coin.name}: #{coin.number_needed}" if coin.number_needed > 0}
end


# run the app
change_required = get_amount("payment made in pence") -  get_amount("cost of items in pence")
calculate_change(change_required, available_coins)

