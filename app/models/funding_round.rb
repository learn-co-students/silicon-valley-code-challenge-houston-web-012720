class FundingRound

  attr_accessor :startup, :venture, :type, :investment

  @@all = []

  def initialize(startup, venture, type, investment)
    @startup, @venture, @type, @investment  = startup, venture, type, investment
    @@all << self
  end

  def self.all
    @@all
  end  

end
