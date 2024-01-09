module McKeemanGrammar
  module Controls
    module String
      def self.example(prefix: nil)
        str = "some-string"

        if not prefix.nil?
          "#{prefix}-#{str}"
        else
          str
        end
      end

      def self.random
        prefix = Random.string

        example(prefix:)
      end
    end
  end
end
