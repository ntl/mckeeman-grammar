module McKeemanGrammar
  module Pattern
    class Alternative
      include Pattern
      include Initializer

      def item_patterns
        @item_patterns ||= []
      end

      def add_item_pattern(item_pattern)
        item_patterns << item_pattern
      end
      alias :<< :add_item_pattern

      def match(text)
        items = item_patterns.map do |item_pattern|
          match = item_pattern.match(text)

          return nil if match.nil?

          text = text[match.length..]

          match
        end

        Match.build(*items)
      end

      def source
        source = String.new

        item_patterns.each_with_index do |item_pattern, index|
          if not index.zero?
            source << " "
          end

          source << item_pattern.source
        end

        source
      end
    end
  end
end
