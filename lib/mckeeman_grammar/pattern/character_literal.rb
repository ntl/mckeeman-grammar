module McKeemanGrammar
  module Pattern
    class CharacterLiteral
      include Pattern
      include Initializer

      initializer :characters

      def match(text)
        if not characters?(text)
          return nil
        end

        Match.build(characters)
      end

      def characters?(text)
        text.start_with?(characters)
      end

      def source
        "\"#{characters}\""
      end
    end
  end
end
