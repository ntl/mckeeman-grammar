module McKeemanGrammar
  module Controls
    module Grammar
      def self.example
        <<~GRAMMAR
        some_rule
            character_literal
            range
            singleton

        some_optional_rule
            ""
            some_rule

        character_literal
            "some-text"

        range
            'a' . 'z'
            'A' . 'Z' - 'B' . 'C' - 'E' . 'F'

        singleton
            'x'
            '09AF'
            '018BF'
            '1027CF'
        GRAMMAR
      end
    end
  end
end
