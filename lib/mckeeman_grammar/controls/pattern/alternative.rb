module McKeemanGrammar
  module Controls
    module Pattern
      module Alternative
        def self.example(*segments)
          if segments.empty?
            segments = self.segments
          end

          McKeemanGrammar::Pattern::Alternative.build(*segments)
        end

        def self.segments
          [
            Text.words.first,
            (0..),
            Text.words.last
          ]
        end
      end
    end
  end
end
