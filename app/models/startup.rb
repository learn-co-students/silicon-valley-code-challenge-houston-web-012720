class Startup
 attr_reader :founder
 attr_accessor :domain, :name

    @@all = []

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain 
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder)
        @@all.select{|startup| startup.founder == founder}
    end

    def self.domains
        @@all.map {|startup| startup.domain}.uniq
    end

    def sign_contract(vc, inv_type, inv)
        FundingRound.new(self, vc, inv, inv_type)
    end

    def rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        rounds.count
    end 

    def total_funds
        rounds.sum {|sum=0, round| sum += round.investment}
    end

    def investors
        rounds.map {|round| round.venture_capitalist}.uniq
    end

    def investor_names
        investors.map {|investor| investor.name}
    end

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_comma_club.include? (investor)}
    end





end
