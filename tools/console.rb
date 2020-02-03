require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("Random Startup", "Tommy", "www.randomstartup.com")

v1 = VentureCapitalist.new("Ashton", 10000526009)
v2 = VentureCapitalist.new("Todd", 10006869)

fr1 = FundingRound.new(s1, v1, "Seed", 10000)
fr2 = FundingRound.new(s1, v2, "Seed", 1434200)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
