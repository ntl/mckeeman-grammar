module McKeemanGrammar
  module Controls
    module Text
      def self.example(prefix: nil)
        segments = self.segments

        if not prefix.nil?
          segments.unshift(prefix)
        end

        segments.join
      end

      def self.other_example
        "some-other-text"
      end

      def self.random
        prefix = Random.string

        example(prefix:)
      end

      def self.segments
        ["some", delimiter, "text"]
      end

      def self.delimiter
        "-"
      end
    end
  end
end
