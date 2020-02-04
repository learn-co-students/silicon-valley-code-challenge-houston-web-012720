# startup < fund > VC
class VentureCapitalist
    @@all = [ ]
    attr_reader :name
    def initialize (name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    # def investments
    #     FundingRound.all.select do |fund|
    #         fund.venture_capitalist == self
    #     end
    # end
    def total_worth
        funding_rounds.map do |invest|
         invest.investment
        end.reduce(:+)
    end
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end
    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist == self}
    end
    def portfolio
        funding_rounds.map{|fr| fr.startup.name}.uniq
    end
    def biggest_investment
        amt_array = funding_rounds.map{|fr| fr.investment}
        amt_array_max = amt_array.max{ |a, b| a<=>b}
        amt_array_max_index = amt_array.index(amt_array_max)
        funding_rounds[amt_array_max_index]
    end
    def invested(domain)
        fr_domain = funding_rounds.select{|fr| fr.startup.domain == domain}
        fr_domain.map{|fr| fr.investment}.reduce(:+)
    end
    def self.tres_commas_club
        vc_hash = {}
        tres_comma = []
        FundingRound.all.each do |fr|
            if vc_hash[fr.venture_capitalist]
                vc_hash[fr.venture_capitalist] += fr.investment
            else
                vc_hash[fr.venture_capitalist] = fr.investment
            end
        end
        vc_hash.each do |k, v|
            if v > 1000000000
                tres_comma << k
            end
        end
        tres_comma
    end
end