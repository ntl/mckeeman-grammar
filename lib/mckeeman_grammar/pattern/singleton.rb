module McKeemanGrammar
  module Pattern
    class Singleton
      include Pattern
      include Initializer

      initializer :codepoint

      def match(text)
        codepoint = text.unpack1("U")

        if not codepoint?(codepoint)
          return nil
        end

        Match.build(codepoint.chr)
      end

      def codepoint?(codepoint)
        codepoint == self.codepoint
      end

      def source
        self.class.source(codepoint)
      end

      def self.source(codepoint)
        chr = [codepoint].pack("U")

        if /[[:print:]]/.match?(chr)
          "'#{chr}'"
        else
          "'%04X'" % codepoint
        end
      end
    end
  end
end
