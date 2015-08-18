#This is the blackjack game using procedures
#Objects are "hands", "players", "dealing_deck", "dealer"
#Methods are "hit", "stay", "deal", "winning_hand", "busted", shuffle"
#This program asks how many players are playing
#Dealer deals all players two cards each to start
#Then dealer deals his/her own cards 
#Dealer deals to self choosing Hit or Stay
#Dealer then asks each player if they want to Hit or Stay (card up)
#Once all have dealt then card totals are viewed by all players 
#Players are paid or the house takes their money


suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = []
suits.each do |suit|
    cards.each do |card|
      deck << [suit, card]
    end
end
deck.shuffle!


player_hand = []
dealer_hand = []
#all players array holds all cards of players for second round
all_players = []
#counts number of players at the table
#player_num = 0
#how players determine to Hit or Stay
player_total = 0
dealer_total = 0
game_end = 0
response = 'Y'

def game_end(g)
  if g == 1
      puts "Game Over - Shuffle"
  end
  exit
end

def first_deal(deck, player_hand)
  #clear player_hand each time around
  player_hand.clear
  player_hand << deck.pop
  player_hand << deck.pop
end

def deal_cards(player_hand, deck)
  player_hand.clear
  player_hand << deck.pop
  player_hand << deck.pop
end

def calculate_total(cards)
  puts "----------------------------------------"
  puts "Player Thinking....calculates rather to Hit or Stay"
  puts "----------------------------------------"
  arr = cards.map {|item| item[1] }
  total = 0
  arr.each do |value|
      #puts "#{value}"
      if value == 'A'
          total += 11
      elsif value.to_i == 0
          total += 10
      else 
          total += value.to_i
      end
  end
return total
end


def check_dealer_hand(dealer_total,dealer_hand,deck)
  dealer_total = 16
  if dealer_total == 21
    puts "----------------------------------------"
    puts "Dealer Wins ! - Dealer card total is #{dealer_total}"
    puts "----------------------------------------"
    #g variable used to set game end to true
    g = 1
    game_end(g)
  elsif dealer_total > 21
    puts "----------------------------------------"
    puts "Dealer card total is #{dealer_total}"
    puts "Dealer Busted - Pay the Winners !"
    puts "----------------------------------------"
#       game_end = 1
#       puts "game_end is " "#{game_end}"
#       puts "Game Over - Shuffle"b
     exit
  elsif (dealer_total <= 15)
    puts "----------------------------------------"
    puts "Dealer card total is #{dealer_total}"
    puts "Dealer Takes Hit"
    puts "----------------------------------------"
    hit(dealer_total,dealer_hand,deck,ck)
  elsif (dealer_total < 21)
    #puts "dealer_total < 21 > 15"
    p dealer_total
      if dealer_total > 15
        puts "----------------------------------------"
        puts "Dealer card total is #{dealer_total}"
        puts "Dealer Stays & waves hand over her cards"
        puts "----------------------------------------"
      end
  end
  return dealer_total
end

def check_player_hand(player_total,player_hand,deck)
  if player_total == 21
    puts "----------------------------------------"
    puts "Player card total is #{player_total}"
    puts "You Win! - Dealer Pays"
    puts "----------------------------------------"
  elsif player_total > 21
    puts "----------------------------------------"
    puts "Player Busted :( I will take your money"
    puts "----------------------------------------"
  elsif (player_total <= 15)
    puts "----------------------------------------"
    puts "Player Takes Hit"
    puts "----------------------------------------"
    hit(player_total,player_hand,deck)
  elsif (player_total < 21)
    #puts "dealer_total < 21 > 15"
      if player_total > 15
        puts "----------------------------------------"
        puts "Player card total is #{player_total}"
        puts "Player Stays"
        puts "----------------------------------------"
      end
  end
  return player_total
end

def hit(player_total,player_hand,deck)
    while player_total <= 15
      player_hand << deck.pop
      player_total = calculate_total(player_hand)
      puts "----------------------------------------"
      puts "Hit  - new total #{player_total}"
      puts "----------------------------------------"
    end
end

#Game begins by dealer asking how many players are present
  puts "----------------------------------------"
  puts "Welcome to the BlackJack Game - My name is Pamela"
  puts "Do you want to play?"
  puts "please enter 'Y' or 'N'"
  response = gets.chomp
  if response == 'Y' 
    puts "How many players are there at the table?"
    puts "----------------------------------------"
  elsif response == 'N'
    puts "Bye"
    exit
  end

#def start_game()
  # puts "How many players are there at the table?"
  # puts "----------------------------------------"
  #player_num = 0
  player_num = gets.chomp.to_i
  puts "----------------------------------------"
  puts "There are #{player_num} players - Let's Play !"
  puts "----------------------------------------"

 # play_game(player_num)

#def play_game(player_num)
#  puts "starting"
  while player_num > 0
    i = 0
    first_deal(deck,player_hand)
    player_total = calculate_total(player_hand)
    puts "----------------------------------------"
    puts "Player #{player_num} card total is #{player_total}"
    puts "----------------------------------------"
    #build array from player totals by player_num
    all_players[player_num - 1] = player_total
    i += 1
    player_num -= 1
  end
#end

#deal first two cards to dealer
deal_cards(dealer_hand,deck)
dealer_total = calculate_total(dealer_hand)
#dealer takes hit or stays or busted or wins
dealer_total = check_dealer_hand(dealer_total,dealer_hand,deck)


while dealer_total <= 15 
  dealer_total = check_dealer_hand(dealer_total,dealer_hand,deck)
  puts "Dealer total  #{dealer_total}"
  exit
end
puts "----------------------------------------"
puts "Player  - do you want a hit?"
puts "----------------------------------------"
# player starts thinking.....
#ct set up as all Players are asked to Hit or Stay
ct = 1
all_players.each do |v|
  puts "Player cards shown #{ct} total is #{v}"
  player_total = check_player_hand(v,player_hand,deck)
  ct =+ 1
end
puts "----------------------------------------"
puts "View All Player totals #{all_players}"
puts "----------------------------------------"
puts "View Dealer total #{dealer_total}"
puts "----------------------------------------"
# puts "Do you want to play again?"
# puts "please enter 'Y' or 'N'"
# answer = " "
# answer = gets.chomp
# puts "#{answer}"
# if answer == 'Y' 
#   start_game(answer)
# elsif answer == 'N'
#   puts "start over"
# end
#ask about this choice of arrays over hash & how to load hash from arrays
#def load_deck(deck)
#  deck.each
#   puts "inside shuffle"
# deck = {
#     Spades: ['Ace', 'King', 'Queen', 'Jack'],
#     Hearts: ['Ace', 'King', 'Queen', 'Jack'],
#     Clubs: ['Ace', 'King', 'Queen', 'Jack'],
#     Diamonds: ['Ace', 'King', 'Queen', 'Jack']
#   }




  

