require 'humanize'

class Codebreaker
  class Game
    DEFAULT_NUMBER_OF_DIGITS_REQUIRED = 4

    attr_reader :output
    attr_reader :secret_number

    def initialize(output)
      @output = output
      @feedback = {}
    end

    def start(secret_number, number_of_digits_in_secret = DEFAULT_NUMBER_OF_DIGITS_REQUIRED)
      @number_of_digits_in_secret = number_of_digits_in_secret
      @secret_number = secret_number || random_secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
      guess(gets.chomp)
    end

    def guess(input)
      @input = input
      if @input.length != @number_of_digits_in_secret
        output.puts "Try guessing a number with #{@number_of_digits_in_secret.humanize} digits"
        return
      end

      conduct_checks
    end

    private
    def conduct_checks
      check_for_plus
      check_for_min
      print_feedback
    end

    def check_for_plus
      @input.split("").each_with_index do |number, index|
        if @secret_number[index] == number
          @feedback[index] = number
        end
      end
      @plus_count = @feedback.count
    end

    def check_for_min
      @input.split("").each_with_index do |number, index|
        if (@secret_number.split("").include?(number) && @secret_number[index] != number)
          handle_ambiguous_cases(number, index)
        end
      end
      @min_count = @feedback.count - @plus_count
    end

    def handle_ambiguous_cases(number, index)
      if !@feedback.has_value? number
        @feedback[index] = number
      end
    end

    def print_feedback
      output.puts "+" * @plus_count + "-" * @min_count

      clear_feedback
    end

    def clear_feedback
      @feedback = {}
    end

    def random_secret_number
      secret_number = ""
      @number_of_digits_in_secret.times {
        digit = rand(9)
        secret_number += digit.to_s
      }

      secret_number
    end
  end
end
