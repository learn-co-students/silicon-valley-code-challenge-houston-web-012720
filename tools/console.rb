require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("First Start", "Paul", "FirstStart.com?")
s2 = Startup.new("Second Start", "Blake", "SecondStart.com?")
s3 = Startup.new("Third Start", "Cornelius", "ThirdStart.com?")

v1 = VentureCapitalist.new("Raul", 12000)
v2 = VentureCapitalist.new("Steven", 200000000000)
v3 = VentureCapitalist.new("Vidhi", 30000)

f1 = FundingRound.new(s1, v1, "A", 100)
f2 = FundingRound.new(s2, v2, "S", 200)
f3 = FundingRound.new(s3, v3, "PS", 300)
f4 = FundingRound.new(s3, v1, "SA", 400)
f5 = FundingRound.new(s1, v2, "SB", 500)
f6 = FundingRound.new(s2, v3, "SC", 600)











binding.pry
0 #leave this here to ensure binding.pry isn't the last line