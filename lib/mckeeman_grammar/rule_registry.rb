module McKeemanGrammar
  class RuleRegistry
    Error = Class.new(RuntimeError)

    def rules
      @rules ||= {}
    end

    def register(rule)
      rule_name = rule.rule_name

      if rules.key?(rule_name)
        raise Error, "Already registered #{rule_name.inspect}"
      end

      rules[rule_name] = rule
    end

    def get(rule_name)
      rules[rule_name]
    end

    def registered?(rule_or_rule_name)
      if rule_or_rule_name.is_a?(Symbol)
        rule_name = rule_or_rule_name
      else
        rule = rule_or_rule_name
        rule_name = rule.rule_name
      end

      rules.key?(rule_name)
    end
  end
end
