class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
      answer = gets.chomp
      guess(gets.chomp)
    end

    def guess(input)
      # Make sure to replace next line with the actual implemented marking algorithm,
      # using the @secret_number

      if input.length != 4
        output.puts "Try guessing a number with four digits"
      end
    end
  end
end
