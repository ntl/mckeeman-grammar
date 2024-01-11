module McKeemanGrammar
  module Controls
    module Pattern
      module Name
        def self.example(rule_name: nil, rules: nil)
          rule_name ||= self.rule_name
          rules ||= self.rules

          McKeemanGrammar::Pattern::Name.build(rule_name, rules)
        end

        def self.rule_name
          Controls::Rule.name
        end

        def self.rules
          {
            rule_name => Rule.example
          }
        end

        module UnknownRule
          def self.example
            rule_name = Controls::Rule::Name.random

            Name.example(rule_name:)
          end
        end
      end
    end
  end
end
