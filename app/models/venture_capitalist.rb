class VentureCapitalist

    attr_reader :name

    @@all =[]

    def initialize(name)
        @name = name
        @@all << self
    end

    def rounds
        FundingRound.all.select{|round|round.venture_capitalist == self}
    end

    def portfolio
        rounds.map{|round|round.startup}.uniq
    end

    def total_worth
        rounds.sum {|sum = 0, round|sum = sum+round.investment}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, amount, type)
    end

    def biggest_investment
        rounds.max_by { |round|
            round.investment
        }
    end

    def domains 
        rounds.map {|round|round.startup.domain}.uniq
    end

    def invested(domain)
        rounds.sum { |sum=0.0, round|
            # binding.pryby
            if round.startup.domain == domain 
                sum = sum.to_f + round.investment.to_f
            else
                sum
            end
        }
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        @@all.select{|vc|vc.total_worth > 1000000}
    end
end
