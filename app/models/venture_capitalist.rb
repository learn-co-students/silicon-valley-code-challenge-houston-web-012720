class VentureCapitalist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def total_worth
        funding_rounds.reduce(0) {|sum, funding| sum + funding.investment}
    end

    def funding_rounds
        FundingRound.all.select{|funding| funding.venture_capitalist == self}
    end

    def self.tres_commas_club
        all.select {|vc| vc.total_worth > 1000000000}
    end
    
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def portfolio
        funding_rounds.map {|fr| fr.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max {|a, b| a.investment <=> b.investment}
    end

    def invested(domain)
        funding_rounds_by_domain = funding_rounds.select {|fr| fr.startup.domain == domain}
        funding_rounds_by_domain.reduce(0) {|sum, fr| sum + fr.investment}
    end
end
