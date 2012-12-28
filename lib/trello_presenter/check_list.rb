module TrelloPresenter
  class CheckList
    attr_reader :name, :id, :items
    
    def self.build(lists)
      lists.map {|l| new(l) }
    end
    
    def initialize(raw_data)
      @raw_data = raw_data
      @name     = raw_data['name']
      @id       = raw_data['id']
      @items    = raw_data['checkItems'].map {|i| i['name'] }
    end
    
  end
end