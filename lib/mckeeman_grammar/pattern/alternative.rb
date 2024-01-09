module McKeemanGrammar
  module Pattern
    class Alternative
      include Pattern
      include Initializer

      initializer :segment_patterns

      def self.build(segment, *segments)
        segments.unshift(segment)

        segment_patterns = segments.map do |segment|
          case segment
          in String => characters
            CharacterLiteral.new(characters)
          in ::Range => range
            Range.build(range)
          ## Test
          in Integer => codepoint
            Singleton.build(codepoint)
          in Pattern
            segment
          end
        end

        new(segment_patterns)
      end

      def match(text)
        segments = segment_patterns.map do |segment_pattern|
          match = segment_pattern.match(text)

          return nil if match.nil?

          text = text[match.length..]

          match
        end

        Match.build(*segments)
      end

      def source
        source = String.new

        segment_patterns.each_with_index do |segment_pattern, index|
          source << " " if not index.zero?

          source << segment_pattern.source
        end

        source
      end
    end
  end
end
