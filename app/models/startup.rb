class Startup
    attr_reader :founder, :domain, :name

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

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self,venture_capitalist, type, investment)
    end 
    
    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.find_by_founder(name)
        @@all.find {|founder| founder.name == name}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end

    def funding_rounds
        FundingRound.all.select{|funding| funding.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.reduce(0) {|sum, funding| sum + funding.investment}
    end

    def investors
        funding_rounds.map {|funding| funding.venture_capitalist}.uniq
    end

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end

end