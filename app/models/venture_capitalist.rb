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
  
    def funding_rounds
      FundingRound.all.select { |f| f.venture == self }
    end  
  
    def self.tres_commas_club
      @@all.select { |v| v.total_worth > 1000000000 }
    end  
  
      def offer_contract(startup, type, amount)
        FundingRound.new(startup,self, type, amount)
      end
  
      def portfolio
        funding_rounds.map {|f| f.startup}.uniq
      end
  
      def biggest_investment
        funding_rounds.max {|a,b| a.amount <=> b.amount}
      end
      
      def invested(domain)
        i = portfolio.find {|p| p.domain == domain }
        i.total_funds
      end
  
  end