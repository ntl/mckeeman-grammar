module McKeemanGrammar
  module Controls
    module Pattern
      module Alternative
        def self.example(*segment_patterns)
          if segment_patterns.empty?
            segment_patterns = self.segment_patterns
          end

          McKeemanGrammar::Pattern::Alternative.new(segment_patterns)
        end

        def self.segment_patterns
          first_word, range, last_word = Text.segments

          first_word = CharacterLiteral.example(first_word)
          range = Range::All.example
          last_word = CharacterLiteral.example(last_word)

          [first_word, range, last_word]
        end
      end
    end
  end
end
