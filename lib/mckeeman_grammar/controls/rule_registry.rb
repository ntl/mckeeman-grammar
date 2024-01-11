module McKeemanGrammar
  module Controls
    module RuleRegistry
      def self.example(rule=nil)
        rule ||= self.rule

        rule_registry = McKeemanGrammar::RuleRegistry.new
        rule_registry.register(rule)
        rule_registry
      end

      def self.rule
        Rule.example
      end
    end
  end
end
