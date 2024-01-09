module McKeemanGrammar
  module Controls
    module Text
      def self.example(prefix: nil)
        words = self.words

        if not prefix.nil?
          words.unshift(prefix)
        end

        words.join(delimiter)
      end

      def self.other_example
        "some-other-text"
      end

      def self.random
        prefix = Random.string

        example(prefix:)
      end

      def self.words
        ["some", "text"]
      end

      def self.delimiter
        "-"
      end
    end
  end
end
