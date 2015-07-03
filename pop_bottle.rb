# Rules:
# For every two empty bottles, you can get one free (full) bottle of pop
# For every four bottle caps, you can get one free (full) bottle of pop
# Each bottle of pop costs $2 to purchase

# Given these parameters, write a program so that you can figure out 
# how many total bottles of pop can be redeemed given a customer investment.
require 'byebug'

def buy_pop(inv)
  b = inv/2.floor
  tot_bot = b
  empty_bot = b
  cap = b

  while empty_bot >= 2 || cap >= 4
    
    n_eb = empty_bot/2.floor
    n_ec = cap/4.floor

    empty_bot = empty_bot%2
    cap = cap%4

    b = n_eb + n_ec
    
    empty_bot += b
    cap += b

    tot_bot += b

  end
  
  return tot_bot

end

def empty_bot(num)
  
end

def bot_cap(num)

end 

puts buy_pop(2) == 1
puts buy_pop(8) == 11
puts buy_pop(10) == 15
puts buy_pop(20) == 35