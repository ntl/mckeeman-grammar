module McKeemanGrammar
  module Pattern
    class Name
      UnknownRuleError = Class.new(RuntimeError)

      include Pattern
      include Initializer

      initializer :rule_name, :rule_registry

      def self.build(rule_name, rule_registry=nil)
        rule_registry ||= RuleRegistry.new

        new(rule_name, rule_registry)
      end

      def match(text)
        rule = rule_registry.get(rule_name)

        if rule.nil?
          raise UnknownRuleError, "Unknown rule `#{rule_name}'"
        end

        rule.match(text)
      end

      def source
        rule_name.to_s
      end
    end
  end
end
