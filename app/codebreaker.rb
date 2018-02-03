class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
      @feedback = ""
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
      guess(gets.chomp)
    end

    def guess(input)
      if input.length != 4
        output.puts "Try guessing a number with four digits"
      else
        loop_answer(input)
      end
    end

    def loop_answer(input)
      input.split("").each_with_index do |number, index|
        if @secret_number.split("").include? number
          check_answer(number, index)
        end
      end
      output.puts @feedback
    end

    def check_answer(number, index)
      if @secret_number[index] == number
        @feedback += "+"
      else
        @feedback += "-"
      end
    end

  end
end
