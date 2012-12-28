module TrelloPresenter
  class Board
    attr_reader :lists, :name
    
    def initialize(raw_data)
      @raw_data = raw_data
      @name     = raw_data['name']
      @lists    = List.build(raw_data['lists'])
      
      Card.build(self, cards:       raw_data['cards'], 
                       check_lists: raw_data['checklists']
      )
    end
    
    private
    
    attr_reader :raw_data
  end
end