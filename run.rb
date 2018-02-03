require_relative 'app/codebreaker'

g = Codebreaker::Game.new(STDOUT)

str = ""
4.times {
  i = rand(9)
  str += i.to_s
}

p "secret number is #{str}"
g.start(str)
