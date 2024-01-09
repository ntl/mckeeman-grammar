module McKeemanGrammar
  module Pattern
    class Alternative
      include Pattern
      include Initializer

      initializer :item_patterns

      def self.build(item, *items)
        items.unshift(item)

        item_patterns = items.map do |item|
          case item
          in String => characters
            CharacterLiteral.new(characters)
          in ::Range => range
            Range.build(range)
          ## Test
          in Integer => codepoint
            Singleton.build(codepoint)
          in Pattern
            item
          end
        end

        new(item_patterns)
      end

      def match(str, &blk)
        item_patterns.each do |item_pattern|
          item_pattern.match(str) do |match|
            match_length = match.length

            str = str[match_length..]

            blk.(match)
          end
        end
      end

      def source
        source = String.new

        item_patterns.each_with_index do |item_pattern, index|
          source << " " if not index.zero?

          source << item_pattern.source
        end

        source
      end
    end
  end
end
