module TrelloPresenter
  class Exporter
    attr_accessor :board

    def initialize(raw_data)
      @board  = Board.new(raw_data)
      @output = []
    end

    def export(destination, format = :markdown)
      write "# #{board.name}"
      
      
      board.lists.each do |list|
        write "\n## #{list.name}\n" unless list.cards.empty?
        
        list.cards.each do |card|
          write "\n### #{card.name}\n"
          write card.description
          card.check_lists.each do |check_list|
            write ""
            check_list.items.each do |item|
              write "- #{item}"
            end
          end
        end
      end

      File.open(destination, 'w') { |f| f.write(output) }
    end

    private

    def output
      @output.join("\n")
    end

    def write(string)
      @output << string
    end
  end
end