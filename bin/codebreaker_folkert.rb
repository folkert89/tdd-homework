#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path('../../app', __FILE__))
require 'codebreaker'

game = Codebreaker::Game.new(STDOUT)

puts "Enter the number of digits that the secret should contain:"

number_of_digits_in_secret = gets.chomp
while (!number_of_digits_in_secret.match(/^(\d)+$/))
  puts "You need to enter a number, try again:"
  number_of_digits_in_secret = gets.chomp
end

game.start(nil, number_of_digits_in_secret.to_i)

while (guess = gets.chomp)
  game.guess(guess)
end
