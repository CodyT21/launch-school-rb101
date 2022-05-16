=begin
Twenty-One follows a similar ruleset to tradition blackjack,
except it is a more basic version. There are no splits, double downs,
or other plays outside of the "hitting" and "staying"
=end

# require 'pry-byebug'

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

# deal cards return a nested array of 2 sets of cards
# method will alter the deck hash that is passed in
def deal_hands!(deck)
  hands = []
  2.times do # loop for dealer and player
    hand = []
    2.times do # loop for dealing 2 cards
      suit = [:hearts, :diamonds, :clubs, :spades].sample
      card = deck[suit].sample
      card_index = deck[suit].index(card)
      # binding.pry
      deck[suit].delete_at(card_index)
      hand << "#{card} of #{suit.to_s.capitalize}"
    end
    hands << hand
  end
  hands # index 0 is the dealer hand, index 1 is the player hand
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

def display_cards(hands)
  hands.each do |hand|
    if hands.index(hand) == 0 # dealer hand - display random card
      prompt("Dealer has: #{hand.sample} and unknown card")
    else
      prompt("Player has: #{joinand(hand)}")
    end
  end
end

# deck = initialize_deck
# hands = deal_hands!(deck)
# display_cards(hands)
