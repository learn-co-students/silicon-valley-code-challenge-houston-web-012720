# startup < fund > VC
class Startup
    @@all = [ ]
    attr_reader :name , :founder , :domain
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    def self.all
        @@all
    end
    def pivot(domain , name)
        @domain = domain
        @name = name
    end
    def self.find_by_founder(founder_name)
        all.find{|startup| startup.founder == founder_name}
    end
    def self.domains
        all.map{|startup| startup.domain}.uniq
    end
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end
    def funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}
    end
    def num_funding_rounds
        funding_rounds.count
    end
    def total_funds
        funding_rounds.map{|fr| fr.investment}.reduce(:+)
    end
    def investors
        funding_rounds.map {|fr| fr.venture_capitalist}.uniq
    end
    def big_investors
        investors.select{|vc| VentureCapitalist.tres_commas_club.include?(vc)}
    end
end