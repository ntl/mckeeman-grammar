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

      module Read
        def self.call(filename)
          local_file = local_file(filename)

          ::File.read(local_file)
        end

        def self.local_file(filename)
          ::File.join(local_dir, filename)
        end

        def self.local_dir
          ::File.join(__dir__, ::File.basename(__FILE__, ".rb"))
        end
      end

      module McKeemanForm
        def self.example
          raw_text = Read.(filename)

          # McKeeman Form grammar appears to have a mistake in its specification of itself
          # Nathan Ladd, Tue Jan 16 2024
          incorrect_text = <<~PATTERN
          rule
              name newline
              nothing
              alternatives
          PATTERN

          correct_text = <<~TEXT
          rule
              name newline nothing alternatives
          TEXT

          incorrect_text_pattern = Regexp.new(incorrect_text, Regexp::MULTILINE)
          raw_text.gsub(incorrect_text_pattern, correct_text)
        end

        def self.filename
          "mckeeman-form.txt"
        end
      end
    end
  end
end
