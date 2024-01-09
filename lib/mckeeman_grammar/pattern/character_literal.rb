module McKeemanGrammar
  module Pattern
    class CharacterLiteral
      include Pattern
      include Initializer

      initializer :characters

      def match(str, &blk)
        if not characters?(str)
          raise StopIteration
        end

        items = [characters]
        match = Match.new(items:)

        blk.(match)
      end

      def characters?(str)
        str.start_with?(characters)
      end

      def source
        "\"#{characters}\""
      end
    end
  end
end
