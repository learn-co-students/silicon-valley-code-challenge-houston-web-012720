# startup < fund > VC
class FundingRound
    @@all = []
    attr_reader :startup, :venture_capitalist, :type, :investment
    def initialize(startup, venture_capitalist, type, investment)
        @Alexander Startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end
    def self.all
        @@all
    end
end
