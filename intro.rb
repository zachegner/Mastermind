class Intro
  attr_accessor :input

  def initialize
    puts "Welcome to CodeBreaker!\n\n"
    # gets input from user to select game. Must be 1 or 2
    until [1, 2].include?(@input)
      puts 'Would you like to play (1)Maker or (2)Breaker?'
      @input = gets.chomp.to_i
      system 'clear'
    end
  end
end
