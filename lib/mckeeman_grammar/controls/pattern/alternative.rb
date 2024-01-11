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

        def self.segments
          [
            Text.words.first,
            (0..),
            Text.words.last
          ]
        end

        def self.segment_patterns
          first_word, range, final_word = self.segments

          [
            CharacterLiteral.example(first_word),
            Range.example(range:, exclusions: :none),
            CharacterLiteral.example(final_word)
          ]
        end
      end
    end
  end
end
