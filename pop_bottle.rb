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
    b = empty_bot/2.floor + cap/4.floor

    empty_bot = empty_bot%2
    cap = cap%4
    
    empty_bot += b
    cap += b
    tot_bot += b
  end
  
  return tot_bot

end

def buy_pop_rec(inv)
  # all this function does is to initialize the counters and call the recursive function
  # http://stackoverflow.com/questions/10567102/how-to-use-an-index-variable-in-a-recursion
  @tot_bot = 0
  @empty_bot = 0
  @caps = 0
  recursion(inv)
end

def recursion(inv)
  # calculate the number of bottles that can be bought with inv dollars
  bots = inv/2.floor
  
  # increment the counters
  @tot_bot += bots
  @empty_bot += bots
  @caps += bots
  
  # recursion is finished if no new bottles can be exchanged 
  return @tot_bot if @empty_bot < 2 && @caps < 4
  # bots is the number of bottles that can be redeemed from the empty bottles and caps
  bots = @empty_bot/2.floor + @caps/4.floor
  # calculate the leftover empty bottles and caps after redemption
  @empty_bot = @empty_bot%2
  @caps = @caps%4
  
  recursion(bots*2)

end

# puts buy_pop(2) == 1
# puts buy_pop(8) == 11
# puts buy_pop(10) == 15
# puts buy_pop(20) == 35


puts buy_pop_rec(2) == 1

puts buy_pop_rec(8) == 11
puts buy_pop_rec(10) == 15
puts buy_pop_rec(20) == 35
