module Guess
  def self.check_guess(guess, answer)
    i = 0
    @@x = 0
    @@y = 0
    @@z = 0
    guess.each do |input|
      if input == answer[i]
        @@x += 1
      elsif answer.include?(input)
        @@y += 1
      else
        @@z += 1
      end
      i += 1
    end
    return feedback
    #puts "#{@@x} colors in the right position"
    #puts "#{@@y} colors in the wrong position"
    #puts       "#{@@z} colors not in the code"
  end

  def self.feedback
    feedback = []
    @@x.times { feedback << "O"}
    @@y.times { feedback << "*"}

    if feedback.length < 4
      (4 - feedback.length).times { feedback << " "}
    end
    return feedback[0..3]
  end

  def self.won?()
    feedback.all? { |pin| pin == "O"}
  end

end
