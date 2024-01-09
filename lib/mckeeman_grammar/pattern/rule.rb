module McKeemanGrammar
  module Pattern
    class Rule
      include Pattern
      include Initializer

      initializer :rule_name, :alternatives

      def self.build(rule_name, alternative, *alternatives)
        alternatives.unshift(alternative)

        new(rule_name, alternatives)
      end

      def match(text)
        longest_match = nil

        alternatives.each do |alternative|
          match = alternative.match(text)

          if match.nil?
            next
          end

          match.rule_name = self.rule_name

          longest_match ||= match

          if match.length > longest_match.length
            longest_match = match
          end
        end

        longest_match
      end

      def source
        source = String.new

        io = StringIO.new(source)

        io.puts(rule_name)

        indentation = " " * 4

        alternatives.each do |alternative|
          io.print(indentation)

          alternative_source = alternative.source
          io.puts(alternative_source)
        end

        io.close

        source
      end
    end
  end
end
