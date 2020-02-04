class Startup

    attr_reader :domain, :founder
    attr_accessor :name #:domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def nonsense
        FundingRound.all.select{|x|x.startup == self}
    end

    def pivot(new_domain, new_name)
        @name = new_name #why self no work?
        @domain = new_domain
    end

    def self.find_by_founder(name)
        @@all.find{|x| x.founder == name}
    end

    def self.domains
        @@all.select{|startup| startup.domain} #why it return whole instance??
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end 

    def num_funding_rounds
         FundingRound.all.select{|x| x.startup == self}.count
    end

    def total_funds
         nonsense.reduce(0){|sum, x| sum + x.investment}
    end

    def investors
        nonsense.map{|x| x.venture_capitalist.name}.uniq
    end

    def big_investors
        nonsense.select{|x| x.venture_capitalist.total_worth > 1000000000}.uniq
    end

end
