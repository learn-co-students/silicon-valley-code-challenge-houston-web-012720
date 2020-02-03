require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

FIRST = "Bob Bill Anna Mark George Валера Георгий Анам".split(" ")
LAST = "Simpsons Burns Soomro Gavrilchik Obama Путин Гагарин Trump".split(" ")
ADJ = "Happy Noisy Smelly Funny".split(" ")
NOUN = "Place Space Hamburger Mug".split(" ")
TYPES = "Angel, Pre-Seed, Seed, Series A, Series B, Series C".split(", ")

def rand_name
  "#{FIRST.sample} #{LAST.sample}"
end

def rand_place
  "#{ADJ.sample} #{NOUN.sample}"
end

def rand_domain
  "#{NOUN.sample}"
end

5.times do
  Startup.new(rand_place, rand_name, rand_domain)
end

10.times do
  VentureCapitalist.new(rand_name)
end

100.times do
  FundingRound.new(Startup.all.sample, VentureCapitalist.all.sample, rand(1000..5000000), TYPES.sample)
end

puts "The biggest investors are:"
VentureCapitalist.tres_comma_club.each { |vc|
  puts "#{vc.name} invested #{vc.total_worth}"
}

fnder = Startup.all.sample.founder
puts "#{fnder} found the following:"
# binding.pry
Startup.find_by_founder(fnder).each{ |startup|
  puts "#{startup.name} in #{startup.domain}"
}

puts "There are startups for the following:"
Startup.domains.each { |domain|
  puts "#{domain}"
}


vc = VentureCapitalist.all.sample
inv_type = TYPES.sample
inv = rand(1000..5000000)
startup = Startup.all.sample
# binding.pry
nc = startup.sign_contract(vc, inv_type, inv)
puts "#{nc.venture_capitalist.name} has invested #{nc.investment} as a #{nc.type} in #{nc.startup.name}"
puts "#{startup.name} has had #{startup.num_funding_rounds} funding rounds."
puts "#{startup.name} has #{startup.total_funds} in total funds."
puts "#{startup.investor_names.join(", ")} have invested in it."
puts "The big investors are:"

startup.big_investors.each {|investor| puts investor.name}
vc = VentureCapitalist.all.sample
inv_type = TYPES.sample
inv = rand(1000..5000000)
startup = Startup.all.sample
# binding.pry
nc2 = vc.offer_contract(startup, inv_type, inv)
puts "#{nc2.venture_capitalist.name} has invested #{nc2.investment} as a #{nc2.type} in #{nc2.startup.name}"
puts "#{vc.name} invested in:"
vc.portfolio.each{ |su|
 puts su.name
}
puts "But his biggest invesment was for #{vc.biggest_investment.startup.name}, and it was as much as #{vc.biggest_investment.investment}"

d = vc.domains.sample
puts "#{vc.name} has invested in #{d} as much as $#{vc.invested(d)}"

# binding.pry
0 #leave this here to ensure binding.pry isn't the last line