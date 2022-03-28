class Breaker
    attr_accessor :guess
    attr_accessor :secret_code
  
    def initialize; end
  
    def start
      @guess = 0
      game.reset_clues
      @secret_code = Array.new(4) { rand(1..6) }
  
      puts "Guess the secret code. It is a four digit code using only numbers 1-6.\n\n"
      puts "If you guess the right number and position, the computer will show 'X'\n\n"
      puts "If you guess the right number but not position, the computer will show 'O'\n\n"
      puts "You have 12 rounds to crack the code.\n\nGood Luck!\n\n---------------------"
    end
  
    def get_guess
      clues = ''
      @guess = 0
      until @guess.size == 4 && @guess.all? { |x| [1, 2, 3, 4, 5, 6].include?(x)	}
        puts "Enter 4 digits (1-6)\n\n"
        @guess = gets.chomp.split('').map(&:to_i)
        @guess
      end
    end
  end