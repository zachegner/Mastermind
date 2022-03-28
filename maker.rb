class Maker
    def initialize; end
  
    def start
      guess = [1, 1, 1, 1]
      secret_code = 0
      until secret_code.size == 4 && secret_code.all? { |x| [1, 2, 3, 4, 5, 6].include?(x) }
        puts "Pick a four digit number using only #'s 1-6 for the computer to solve.'"
        # seperates string, transforms into array of int
        secret_code = gets.chomp.split('').map(&:to_i)
      end
    end
  
    def get_guess
      if round > 1
        c_length = clues.length
        add_push = 4 - c_length
        new_guess = guess.slice(c_length, c_length)
      end
    end
  end