require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Flatiron", "Avi Bo", "www.fi.com")
s2 = Startup.new("ABC", "Avi Bo Car", "www.abc.com")
s3 = Startup.new("Papa Johns", "Papa John", "www.papa.com")

vc1 = VentureCapitalist.new("Mark Cuban")
vc2 = VentureCapitalist.new("Robert")
vc3 = VentureCapitalist.new("Lori")
vc4 = VentureCapitalist.new("Chris")

fr1 = FundingRound.new(s1, vc1, "Angel", 10000.0)
fr2 = FundingRound.new(s1, vc1, "Series A", 20000.0)
fr3 = FundingRound.new(s1, vc3, "Series A", 120000.0)
fr4 = FundingRound.new(s2, vc1, "Pre-Seed", 10.0)
fr5 = FundingRound.new(s3, vc2, "Seed", 1000000000000000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line