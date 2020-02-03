class Startup
  
    attr_accessor :name, :funding_rounds
    attr_reader :founder, :domain
  
    @@all = []
  
    def initialize(name, founder, domain)
      @name = name
      @founder  = founder
      @domain = domain 
      @@all << self
    end
  
    def pivot(domain, name)
      @name = name
      @domain = domain #test to see if we can change
    end  
  
    def self.all
      @@all
    end
  
    def funding_rounds
      FundingRound.all.select { |f| f.startup == self }
    end  
  
    def num_funding_rounds
      funding_rounds.count
    end  
  
    def self.find_by_founder(founder_name)
      @@all.find { |s| s.founder == founder_name }
    end
  
    def self.domains
      @@all.map { |s| s.domain }
    end  
  
    def sign_contract(venture_capitalist, type, amount)
      FundingRound.new(self, venture_capitalist, type, amount)
    end
  
    def total_funds
      funding_rounds.sum {|s| s.investment}
    end 
  
    def investors
      funding_rounds.map {|f| f.venture}.uniq
    end
  
    def rich_people
      investors.select { |i| i.total_worth > 1000000000 }
    end
  
    def big_investors
      rich_people 
    end
  
  end