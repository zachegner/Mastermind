require './intro.rb'
require './maker.rb'
require './breaker.rb'

class Game
    attr_accessor :game
  
    def initialize
      @intro = Intro.new
      @game = Game
      @choice = ''
      if @intro.input == 2
        play('B')
        # @breaker = Breaker.new
        # @choice = @breaker
      else
        play('M')
        # @maker = Maker.new
        # @choice = @maker
      end
      # play(@choice)
    end
  
    def play_again(win)
      # asks user to play again? only accepts Y,y,N,n
      again = ''
      until %w[Y y N n].include?(again)
        print 'Congratulations you won! ' if win == true
        print 'Nice try! ' if win == false
        puts 'Play again? Y/N'
        again = gets.chomp
      end
      again == 'Y' || again == 'y' ? restart : abort('Thanks for playing!')
    end
  
    def restart
      round = 1
      win = false
      reset_clues
      again = ''
      system 'clear'
      game = Game.new
    end
  
    def reset_clues
      clues_o = ''
      clues_x = ''
      clues = ''
    end
  
    def play(choice)
      round = 1
      win = false
  
      if choice == 'B' # @breaker
        # @breaker.start
        guess = 0
        reset_clues
        secret_code = Array.new(4) { rand(1..6) }
  
        puts "Guess the secret code. It is a four digit code using only numbers 1-6.\n\n"
        puts "If you guess the right number and position, the computer will show 'X'\n\n"
        puts "If you guess the right number but not position, the computer will show 'O'\n\n"
        puts "You have 12 rounds to crack the code.\n\nGood Luck!\n\n---------------------"
      elsif choice == 'M' # @maker
        # @maker.start
        guess = [1, 1, 1, 1]
        secret_code = 0
        until secret_code.size == 4 && secret_code.all? { |x| [1, 2, 3, 4, 5, 6].include?(x) }
          puts "Pick a four digit number using only #'s 1-6 for the computer to solve.'"
          # seperates string, transforms into array of int
          secret_code = gets.chomp.split('').map(&:to_i)
        end
      end
          prev_clues = ''
      until round > 12 || win == true
        puts "Round: #{round}\n\n"
        clues_o = ''
        clues_x = ''
        exs = ''
              ohs = ''
              
              if choice == 'B' # @breaker
          # @breaker.get_guess
          clues = ''
          guess = 0
          until guess.size == 4 && guess.all? { |x| [1, 2, 3, 4, 5, 6].include?(x)	}
            puts "Enter 4 digits (1-6)\n\n"
            guess = gets.chomp.split('').map(&:to_i)
            guess
          end
        elsif choice == 'M' # @maker
                  # @maker.get_guess
                  c_length = prev_clues.length
          if round > 1 && c_length != 4
            
            add_push = 4 - c_length
            new_guess = guess.slice(0, c_length)
            add_push.times { new_guess.push(guess.last + 1) }
            p guess = new_guess
          end
          if c_length == 4
            # p list = guess.combination(4).to_a
            new_guess = guess.shuffle
            p guess = new_guess
          end
  
        end
        exs = guess.zip(secret_code).map { |a, b| clues_x << 'X' if a == b }
        ohs = secret_code.select { |x| clues_o << 'O' if guess.include?(x)	}
        dif = clues_o.size != 0 && clues_x.size != 0 ? clues_x.size % clues_o.size : 0
        dif != 0 ? clues_o.chomp!('O' * dif) : clues_o.chomp!('O' * clues_x.size)
              clues = clues_x + clues_o
              prev_clues = clues
        puts "\nClues: #{clues}\n\n------------------\n"
  
        win = true if clues == 'XXXX'
        round += 1
      end
      play_again(win)
    end
  end