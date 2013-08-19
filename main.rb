require_relative 'coin'
require 'pry'

two_pound = Coin.new("Two Pound coin",200, 1)
one_pound = Coin.new("One Pound coin",100, 0)
fifty_pence = Coin.new("50p piece", 50, 10)
twenty_pence = Coin.new("20p piece", 20, 10)
ten_pence = Coin.new("10p piece",10, 10)
five_pence = Coin.new("5p piece", 5, 10)
two_pence = Coin.new("2p piece", 2, 10)
one_pence = Coin.new("1p piece", 1, 0)

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

available_coins = available_coins.sort_by {|coin| coin.value_in_pence}.reverse

def get_amount(string)
  puts "Enter #{string}"
  gets.chomp.downcase.to_i
end

def calculate_change(change_needed, available_coins)
  available_coins.inject(change_needed){ |remainder, coin| coin.process(remainder)}
  available_coins.each{|coin| puts "#{coin.name}: #{coin.number_needed}" if coin.number_needed > 0}
  owed = change_needed - available_coins.inject(0){|sum, coin| sum + (coin.value_in_pence*coin.number_needed)}
  if owed > 0
    puts "We cannot give the correct change! We owe you #{owed}p."
  end
end

# run the app
change_required = get_amount("payment made in pence") -  get_amount("cost of items in pence")
calculate_change(change_required, available_coins)

