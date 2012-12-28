module TrelloPresenter
  class Card
    attr_reader :id, :name, :description, :list, :archived, :check_lists
    
    def self.build(board, options={})
      options[:cards].each do |card|
        card['check_lists'] = options[:check_lists].select do |l| 
          card['idChecklists'].include? l['id']
        end
      end
      options[:cards].map {|c| new(board, c) }
    end
    
    def initialize(board, raw_data)
      @raw_data    = raw_data
      @board       = board
      @list        = board.lists.find {|l| l.id == raw_data['idList'] }
      @check_lists = CheckList.build(raw_data['check_lists'])
      
      @name        = raw_data['name']
      @id          = raw_data['id']
      @description = raw_data['desc']
      @archived    = raw_data['closed']
      
      @list.cards << self unless archived
    end
    
  end
end