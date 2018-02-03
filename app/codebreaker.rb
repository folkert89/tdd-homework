class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
      @feedback = {}
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
        check_for_plus(input)
        check_for_min(input)
      end
    end

    def check_for_plus(input)
      input.split("").each_with_index do |number, index|
        if @secret_number[index] == number
          @feedback[index] = number
        end
      end
      @plus_count = @feedback.count
      p @plus_count
    end

    def check_for_min(input)
      input.split("").each_with_index do |number, index|
        if ((@secret_number.split("").include? number) && (@secret_number[index] != number))
          validation_rules(number, index)
        end
      end
      translate_feedback
    end

    def validation_rules(number, index)
      if !@feedback.has_value? number
        @feedback[index] = number
      end
    end

    def translate_feedback
      @min_count = @feedback.count - @plus_count
      output.puts "+"*@plus_count + "-"*@min_count
    end
  end
end
