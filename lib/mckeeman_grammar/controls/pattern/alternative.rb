module McKeemanGrammar
  module Controls
    module Pattern
      module Alternative
        def self.example(*item_patterns)
          if item_patterns.empty?
            item_patterns = self.item_patterns
          end

          rule = McKeemanGrammar::Pattern::Alternative.new

          item_patterns.each do |item_pattern|
            rule << item_pattern
          end

          rule
        end

        def self.item_patterns
          first_word, range, last_word = self.items

          first_word = CharacterLiteral.example(first_word)
          range = Range.example(range:, exclusions: :none)
          last_word = CharacterLiteral.example(last_word)

          [first_word, range, last_word]
        end

        def self.items
          [
            Text.segments.first,
            Range::All.range,
            Text.segments.last
          ]
        end
      end
    end
  end
end
