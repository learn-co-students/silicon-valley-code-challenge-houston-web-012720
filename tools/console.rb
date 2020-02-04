require_relative ‘../config/environment.rb’

def reload
  load ‘config/environment.rb’
end

# test variables here
company1 = Startup.new(“nab”, “sumaya”, “medical”)
company2 = Startup.new(“gad”, “stephen”, “medical”)
company3 = Startup.new(“tan”, “Anam”, “factory”)
company4 = Startup.new(“tan”, “Gorgi”, “factory”)
company5 = Startup.new(“ban”, “Mitchel”, “logistic”)
company6 = Startup.new(“pan”, “blake”, “education”)

vc1 = VentureCapitalist.new(“Trash”)
vc2 = VentureCapitalist.new(“Hello”)
vc3 = VentureCapitalist.new(“Ahlem”)
vc4 = VentureCapitalist.new(“Tram”)
vc5 = VentureCapitalist.new(“Ban”)
vc6 = VentureCapitalist.new(“Tan”)

fund1 = FundingRound.new(company1, vc1, “A”, 1000.0)
fund2 = FundingRound.new(company2, vc2, “A”, 2000.4)
fund3 = FundingRound.new(company4, vc2, “B”, 3000.6)
fund4 = FundingRound.new(company5, vc3, “B”, 30000000000000000.7)
fund5 = FundingRound.new(company6, vc3, “B”, 3000000000000.9)
fund6 = FundingRound.new(company6, vc4, “G”, 1000.8)
fund7 = FundingRound.new(company1, vc2, “B”, 25000)
fund8 = FundingRound.new(company1, vc4, “G”, 5500000)

# binding.pry
0 #leave this here to ensure binding.pry isn’t the last line