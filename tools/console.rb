require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("Start Up One", "Founder One", "StartUpOne.com")
s2 = Startup.new("Start Up Two", "Founder Two", "StartUpTwo.com")
s3 = Startup.new("Start Up Three", "Founder One", "StartUpThree.com")
s4 = Startup.new("Start Up Four", "Founder Four", "StartUpFour.com")
s5 = Startup.new("Start Up Five", "Founder Five", "StartUpFive.com")

v1 = VentureCapitalist.new("VC One", 5000000)
v2 = VentureCapitalist.new("VC Two", 15000000)
v3 = VentureCapitalist.new("VC Three", 20000000)
v4 = VentureCapitalist.new("VC Four", 2500000000)
v5 = VentureCapitalist.new("VC Five", 500000000)
v6 = VentureCapitalist.new("VC Six", 1000000001)

f1 = FundingRound.new(s1, v1, "Angel", 500000)
f2 = FundingRound.new(s2, v6, "Seed", 1000000)
f3 = FundingRound.new(s3, v4, "Series A", 5000000)
f4 = FundingRound.new(s1, v5, "Pre-Seed", 50000000)
f5 = FundingRound.new(s4, v3, "Series B", 5000000)
f6 = FundingRound.new(s5, v2, "Angel", 1000000)
f7 = FundingRound.new(s1, v2, "Pre-Seed", 2000000)
f8 = FundingRound.new(s1, v2, "Pre-Seed", 2000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line