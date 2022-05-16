=begin
Twenty-One follows a similar ruleset to tradition blackjack,
except it is a more basic version. There are no splits, double downs,
or other plays outside of the "hitting" and "staying"
=end

require 'pry-byebug'

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  {
    hearts: %w(2 3 4 5 6 7 8 9 Jack Queen King Ace),
    diamonds: %w(2 3 4 5 6 7 8 9 Jack Queen King Ace),
    clubs: %w(2 3 4 5 6 7 8 9 Jack Queen King Ace),
    spades: %w(2 3 4 5 6 7 8 9 Jack Queen King Ace)
  }
end

# deal_hands! returns a nested array of 2 sets of hands
# method will alter the deck hash that is passed in (through deal_card!)
def deal_hands!(deck)
  hands = []
  2.times do # loop for dealer and player
    hand = []
    2.times do # loop for dealing 2 cards
      card = deal_card!(deck)
      hand << card
    end
    hands << hand
  end
  hands # index 0 is the dealer hand, index 1 is the player hand
end

# deal_card will return a single card from the deck hash as a string
# method will modify hash that is passed in
def deal_card!(deck)
  # check if cards for specific suit are still available
  suit = nil
  until suit
    suit = deck.keys.sample
    if deck[suit].empty?
      suit = nil
    end
  end
  card = deck[suit].sample
  card_index = deck[suit].index(card)
  deck[suit].delete_at(card_index)
  "#{card} of #{suit.to_s.capitalize}"
end

# helper method to improve appearance of printing each element from
# and array with a custom separator and final separator
def joinand(elems, separator=', ', last_separator='and')
  case elems.length
  when 0 then ''
  when 1 then elems.first.to_s
  when 2 then elems.join(" #{last_separator} ")
  else
    str = ''
    elems.each_with_index do |num, index|
      str << if index < elems.length - 1
               num.to_s + separator
             else
               "#{last_separator} #{num}"
             end
    end
    str
  end
end

def display_hands(hands)
  hands.each do |hand|
    if hands.index(hand) == 0 # dealer hand - display random card
      hand_length = hand.length
      prompt("Dealer has: #{joinand(hand[1, hand_length])} and unknown card")
    else
      prompt("Player has: #{joinand(hand)}")
    end
  end
end

# hit! will mutate the hands array and deck hash
def hit!(hands, deck, player=true)
  if player
    hands[1] << deal_card!(deck)
  else
    hands[0] << deal_card!(deck)
  end
end

# busted will return boolean of whether hand passed in has exceeeded 21
def busted?(hand)
  total = hand_total(hand)
  total > 21
end

# returns new array of integer values from array of card strings
def hand_total(hand)
  card_values = []
  hand.each do |card|
    card_value = card.split[0]
    card_values << if card_value.match(/(Jack|Queen|King)/)
                     10
                   elsif card_value.match('Ace')
                     1 # ace_value(hand)
                   else
                     card.to_i
                   end
  end
  card_values.sum
end

# determines if user inputs a string of hit or stay
def valid_input?(str)
  str.downcase.match(/^(hit|stay)$/)
end

# calculates and compare totals if both users stay
# returns true if player has won the round
def player_wins?(hands)
  dealer_total = hand_total(hands[0])
  player_total = hand_total(hands[1])
  player_total > dealer_total
end

# main program logic
deck = initialize_deck
hands = deal_hands!(deck)
display_hands(hands)
prompt("Player total is: #{hand_total(hands[1])}")

# player turn
loop do
  puts 'hit or stay?'
  user_response = gets.chomp
  if !valid_input?(user_response)
    prompt("Invalid input. Please enter either 'hit' or 'stay'.")
    next
  end
  if user_response.downcase == 'hit'
    hit!(hands, deck)
    prompt("You're card is: #{hands[1].last}")
    prompt("You're total is: #{hand_total(hands[1])}")
  end
  break if user_response == 'stay' || busted?(hands[1])
end

if busted?(hands[1])
  prompt('Sorry, you have gone over 21 and lost. Better luck next time!')
else
  prompt("You have chosen to stay.")
  puts
  prompt("It is now the dealer's turn!")
end
