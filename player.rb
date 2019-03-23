
class Player 
  attr_accessor :name
  @@code = []
  def initialize(name)
    @name = name
    @colors = ["red", "blue", "green", "yellow", "brown", "orange", "black", "white"]
  end

  def create_code()
    delete_code()
    valid = false
    while valid == false
      puts "Please enter your code below"
      user_code = gets.chomp
      if check_input(user_code.downcase().split(" ")) == false
        puts "Entered code is not valid"
      else
        puts "code is valid"
        break
      end
    end
    return user_code.downcase().split(" ")
  end

  def player_guess()
    loop do
      str = gets.chomp
      guess = str.downcase().split(" ")
      if check_input(guess) == false
        puts
        puts "invalid code, make sure your code only contains"
        puts     "4 colors, and that those colors are allowed"
        puts                                "Please try again"
        puts
      else
        return guess
        break
      end
    end
  end

  private 

    def check_input(array)
    return false if array.length() < 4 || array.length() > 4
    array.all? { |color| @colors.include? color}
  end


  def push_code(array)
    array.each do |color|
      @@code << color
    end
  end
  
  def delete_code
    @@code = []
  end
end
