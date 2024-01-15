module McKeemanGrammar
  module Controls
    module Pattern
      module Rule
        def self.example(rule_name: nil, alternatives: nil)
          rule_name ||= self.rule_name
          alternatives ||= self.alternatives

          rule = McKeemanGrammar::Pattern::Rule.new(rule_name)

          alternatives.each do |alternative|
            rule << alternative
          end

          rule
        end

        def self.other_example
          MultipleAlternatives.example
        end

        def self.rule_name
          RuleName.example
        end

        def self.alternatives
          [alternative]
        end

        def self.alternative
          Alternative.example
        end

        module New
          def self.example
            alternatives = []

            Rule.example(alternatives:)
          end
        end

        module MultipleAlternatives
          def self.example
            Rule.example(rule_name:, alternatives:)
          end

          def self.rule_name
            Controls::RuleName.other_example
          end

          def self.alternatives
            [
              nothing,
              partial_alternative,
              longer_alternative
            ]
          end

          def self.nothing
            McKeemanGrammar::Pattern::Nothing.build
          end

          def self.partial_alternative
            segment_characters = Text.segments.first
            segment_pattern = CharacterLiteral.example(segment_characters)

            alternative = McKeemanGrammar::Pattern::Alternative.new
            alternative << segment_pattern
            alternative
          end

          def self.longer_alternative
            Rule.alternative
          end
        end
      end
    end
  end
end
