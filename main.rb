#TOP Mastermind project
#create randomly generated code of colors : 
#Setup an array with the colors red, green, blue, yellow, brown, orange, black and white.
#Make a function that generates a new array of 4 random colors.
#Get user input
#iterate through randomly generated code array to see if user selection is correct.
#Give feedback if user has 1 - 4 colors in the right spot or not
#Right color in the wrong spot or right color in the right spot.

require_relative 'player'
require_relative 'bot'
require_relative 'guess'
require_relative 'board'

def intro

  puts "  __  __            _                     _           _ 
 |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
 | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
 |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
  puts
  puts

  puts                       "Please enter your name below"
  $name = gets.chomp
  puts 
  puts
  puts                                       "Hello #{$name.capitalize()}"
  puts                        "Try to break the computer generated code,"
  puts         "Whemp asked type in your code which consists of 4 colors"
  puts     "there are 8 colors to choose from and duplicates are allowed"
  puts "Colors: Red, Blue, Green, Yellow, Brown, Orange, Black and White"
  puts              "You can choose to be a code maker or a code breaker"
  puts
  puts
end

def start
  puts              "Would you like to be the codebreaker or codemaker?"
  puts               "Type 'codemaker' if you want to be the code maker"
  puts           "Type 'codebreaker' if you want to be the code breaker"
  loop do
    choice = gets.chomp
    if choice == "codebreaker"
      code_breaker($name)
      break
    elsif choice == "codemaker"
      code_maker($name)
      break
    else
      puts "please type codebreaker or codemaker"
    end
  end
end

def restart
  puts "Would you like to play again?[Y/N]"
  loop do
    choice = gets.chomp
    if choice.downcase() ==    "n"
      return false
      break
    elsif choice.downcase() == "y"
      return true
      break
    else
      puts   "please enter Y or N"
    end
  end
end

def gameplay
  intro()
  game_on = true
  while game_on == true
    start()
    if restart() == false
      game_on = false
    end
  end
end

def code_maker(name)
  bot = Bot.new
  board = Board.new
  player = Player.new(name)
  answer = player.create_code()
  i = 1
  while i <= 12
    guess = bot.guess(answer)
    puts Guess.check_guess(guess, answer)
    if Guess.won? == true
      puts "Computer has won!"
      break
    end
    i +=1
  end
end

def code_breaker(name)
  player = Player.new(name)
    tries = 12
    bot = Bot.new
    answer = bot.create_code()
    i = 1
    while i <= tries.to_i
      puts "Please enter your code seperated by a space"
      puts                              "Guess no. #{i}"
      guess = player.player_guess
      puts Guess.check_guess(guess, answer)
      if Guess.won? == true
        puts       "Congratulations you cracked the code!"
        puts "From now on you will be known as Code Brian"
        break
      end
      puts "You ran out of tries!\nThe secret code was: #{answer.join(", ")}" if i == tries.to_i
      i += 1
  end
end

gameplay()

