class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|x| x.total_worth > 1000000000}
    end

    def funding_rounds
        FundingRound.all.select{|x| x.venture_capitalist == self}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end 

    def portfolio
        funding_rounds.map{|x| x.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max{|x, y|x.investment <=> y.investment}
    end
end
