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
def deal_cards!(deck)
  dealt_cards = []
  2.times do # loop for dealer and player
    card_set = []
    2.times do # loop for dealing 2 cards
      suit = [:hearts, :diamonds, :clubs, :spades].sample
      card = deck[suit].sample
      card_index = deck[suit].index(card)
      # binding.pry
      deck[suit].delete_at(card_index)
      card_set << "#{card} of #{suit.to_s.capitalize}"
    end
    dealt_cards << card_set
  end
  dealt_cards
end
