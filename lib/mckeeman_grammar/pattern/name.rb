module McKeemanGrammar
  module Pattern
    class Name
      UnknownRuleError = Class.new(RuntimeError)

      include Pattern
      include Initializer

      initializer :rule_name, :rules

      def self.build(rule_name, rules=nil)
        rules ||= {}

        new(rule_name, rules)
      end

      def match(text)
        rule = rules.fetch(rule_name) do
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
