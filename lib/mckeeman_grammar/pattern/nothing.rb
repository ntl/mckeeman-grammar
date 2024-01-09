module McKeemanGrammar
  module Pattern
    class Nothing
      include Pattern

      def self.build
        @instance ||= new
      end

      def match(_text)
        Match.nothing
      end

      def source
        "\"\""
      end
    end
  end
end
