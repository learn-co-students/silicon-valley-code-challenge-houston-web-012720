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

    def self.tres_comma_club
        @@all.select {|name| name.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def fundings
        FundingRound.all.select {|funding| funding.venture_capitalist == self}
    end

    def funding_rounds
        fundings.map {|funding| funding.venture_capitalist}
    end

    def portfolio
        fundings.map {|funding| funding.startup.name}.uniq
    end

    def biggest_investment
        biggest_in = fundings.map {|funding| funding.investment}.max # returns just the value of the largest investment
        fundings.select{|funding| funding.investment == biggest_in} #returns object
    end

    def invested(domain)
        # fundings.select do |funding| 
        #     if funding.startup.domain == domain
        #         funding.investment
        #     end
        # end
        fundings.select{|funding| funding.startup.domain == domain}.map{|startup| startup.investment}.sum
    end
end
