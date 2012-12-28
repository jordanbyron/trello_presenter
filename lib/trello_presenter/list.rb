module TrelloPresenter
  class List
    attr_reader   :name, :id
    attr_accessor :cards
    
    def self.build(lists)
      lists.map {|l| new(l) }
    end
    
    def initialize(raw_data)
      @raw_data = raw_data
      @name     = raw_data['name']
      @id       = raw_data['id']
      @cards    = []
    end
    
  end
end