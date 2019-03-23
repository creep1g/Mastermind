class Bot
  @@code = []
  def initialize
    @colors = ["red", "blue", "green", "yellow", "brown", "orange", "black", "white"]
    @correct_colors = ["x", "x", "x", "x"]
    @guess = []
  end
  
  def create_code 
    delete_code()
    random_picker(@@code)
    puts "Computer has generated code"
    puts @@code
    return @@code
  end

  def guess(answer)
    delete_guess
    puts "Computer is guessing..."
    random_picker(@guess)
    reduce_options(answer)
    puts "Computer guessed: #{@guess.join(", ")}"
    return @guess
  end 

  def reduce_options(answer)
    @guess.each_with_index do |color, index|
      unless answer.include? color
        @colors.delete(color)
      end
      @guess[index] = @correct_colors[index] if @correct_colors[index] != "x"
    end
    @guess.each_with_index do |color, index|
      if answer[index] == color
        @correct_colors[index] = color 
      else
        @correct_colors[index] = "x"
      end
    end
  end

  def delete_code
    @@code = []
  end

  private

  def delete_guess
    @guess = []
  end

  def random_picker(array)
    4.times { array << @colors[rand(@colors.length())]}
  end
end
