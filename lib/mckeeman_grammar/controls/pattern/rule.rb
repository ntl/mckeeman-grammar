module McKeemanGrammar
  module Controls
    module Pattern
      module Rule
        def self.example(rule_name: nil, alternatives: nil)
          rule_name ||= self.rule_name
          alternatives ||= self.alternatives

          McKeemanGrammar::Pattern::Rule.build(rule_name, *alternatives)
        end

        def self.other_example
          MultipleAlternatives.example
        end

        def self.rule_name
          Controls::Rule::Name.example
        end

        def self.alternatives
          [alternative]
        end

        def self.alternative
          Alternative.example
        end

        module MultipleAlternatives
          def self.example
            Rule.example(rule_name:, alternatives:)
          end

          def self.rule_name
            Controls::Rule::Name.other_example
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
            McKeemanGrammar::Pattern::Alternative.build(Text.words.first)
          end

          def self.longer_alternative
            Rule.alternative
          end
        end
      end
    end
  end
end
