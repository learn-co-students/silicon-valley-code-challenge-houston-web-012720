class Startup

    attr_reader :founder, :domain
    attr_accessor :name
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

    def pivot(name, domain)
        @name = name
        @domain = domain 
    end

    def self.find_by_founder(name)
        @@all.find {|startup| startup.founder == name}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end


    def fundings
        FundingRound.all.select {|funding| funding.startup == self}
    end
    
    def num_funding_rounds
        fundings.count
    end

    def total_funds
        # fundings.map {|funding| funding.investment}.sum 
        fundings.reduce(0) {|sum, f| sum + f.investment}

    end

    def investors
        fundings.map {|funding| funding.venture_capitalist.name}.uniq
    end

    def big_investors
        # fundings.select {|funding| funding.venture_capitalist}
        fundings.select{|funding| VentureCapitalist.tres_comma_club.include?(funding.venture_capitalist)}
    end



end
