=begin
Twenty-One follows a similar ruleset to tradition blackjack,
except it is a more basic version. There are no splits, double downs,
or other plays outside of the "hitting" and "staying"
=end

# require 'pry-byebug'
WINNING_NUM = 21
DEALER_LIMIT = 17

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

def display_hands(hands, for_winner=false)
  hands.each do |hand|
    if hands.index(hand) == 0 # dealer hand - display random card
      if for_winner
        prompt("Dealer has: #{joinand(hand)}")
      else
        hand_length = hand.length
        prompt("Dealer has: #{joinand(hand[1, hand_length])} and unknown card")
      end
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

# busted will return boolean of whether hand passed in has exceeeded WINNING_NUM
def busted?(total)
  # total = hand_total(hand)
  total > WINNING_NUM
end

# returns new array of integer values from array of card strings
def hand_total(hand)
  card_values = []
  aces = hand.select { |card| card.include?('Ace') }
  non_ace_cards = hand.select { |card| !card.include?('Ace') }
  non_ace_cards.each do |card|
    card_value = card.split[0]
    card_values << if card_value.match(/(Jack|Queen|King)/)
                     10
                   else
                     card.to_i
                   end
  end
  ace_value!(aces, card_values)
  card_values.sum
end

# calculates value for ace depending on current cards in hand
# add ace values to card_values array that is passed in
def ace_value!(aces, card_values)
  aces.each do
    card_values << if aces.length == 1
                     card_values.sum < 11 ? 11 : 1
                   else
                     card_values.sum < 11 - aces.length ? 11 : 1
                   end
  end
end

# determines if user inputs a string of hit or stay
def valid_input?(str)
  str.downcase.match(/^(hit|stay)$/)
end

# calculates and compare totals if both users stay
# returns true if player has won the round
def player_wins?(player_total, dealer_total)
  # dealer_total = hand_total(hands[0])
  # player_total = hand_total(hands[1])
  player_total > dealer_total
end

# displays winner message output
def display_winner(hands, player_total, dealer_total)
  prompt('The final hands are: ')
  display_hands(hands, true)
  puts
  sleep(1)
  prompt('The final hand totals are: ')
  prompt("Dealer: #{dealer_total}")
  prompt("Player: #{player_total}")

  if dealer_total == player_total
    prompt('This round is a tie.')
  elsif player_wins?(player_total, dealer_total)
    prompt('You won this round!')
  else
    prompt('Sorry the dealer won this round.')
  end
end

# main program logic
loop do
  deck = initialize_deck
  hands = deal_hands!(deck)
  display_hands(hands)
  player_total = hand_total(hands[1])
  dealer_total = hand_total(hands[0])
  prompt("Player total is: #{player_total}")

  1.times do
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
        player_total = hand_total(hands[1])
        prompt("You're card is: #{hands[1].last}")
        prompt("You're total is: #{player_total}")
      end
      break if user_response == 'stay' || busted?(player_total)
    end

    if busted?(player_total)
      prompt("Sorry, you have gone over #{WINNING_NUM} and lost. Better luck next time!")
      break
    else
      prompt("You have chosen to stay.")
      puts
      prompt("It is now the dealer's turn!")
    end

    # dealer turn
    until dealer_total >= DEALER_LIMIT || busted?(dealer_total)
      prompt('Dealer hits.')
      hit!(hands, deck, false)
      dealer_total = hand_total(hands[0])
      prompt("Dealer's card is: #{hands[0].last}")
      sleep(1)
      puts
    end

    if busted?(dealer_total)
      prompt('Dealer busted! You win this round!')
      break
    end

    prompt('Dealer will stay')
    puts
    display_winner(hands, player_total, dealer_total)
  end

  puts
  prompt('Would you like to play again (y/n): ')
  break if !gets.chomp.downcase.start_with?('y')
end
prompt('Thank you for playing!')
