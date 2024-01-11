module McKeemanGrammar
  module Pattern
    class Alternative
      include Pattern
      include Initializer

      initializer :segment_patterns

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
          if not index.zero?
            source << " "
          end

          source << segment_pattern.source
        end

        source
      end
    end
  end
end
