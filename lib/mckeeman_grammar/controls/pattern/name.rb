module McKeemanGrammar
  module Controls
    module Pattern
      module Name
        def self.example(rule_name: nil, rule_registry: nil)
          rule_name ||= self.rule_name
          rule_registry ||= self.rule_registry

          McKeemanGrammar::Pattern::Name.build(rule_name, rule_registry)
        end

        def self.rule_name
          Controls::RuleName.example
        end

        def self.rule_registry
          RuleRegistry.example
        end

        module UnknownRule
          def self.example
            rule_name = Controls::RuleName.random

            Name.example(rule_name:)
          end
        end
      end
    end
  end
end
