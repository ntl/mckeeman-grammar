module McKeemanGrammar
  class Builder
    StateError = Class.new(RuntimeError)

    attr_accessor :current_rule

    def rule_registry
      @rule_registry ||= RuleRegistry.new
    end

    def start_rule(rule_name)
      if current_rule?
        ## Message
        raise StateError
      end

      rule = Pattern::Rule.new(rule_name)
      self.current_rule = rule
    end

    def finish_rule
      assure_current_rule

      rule = self.current_rule
      rule_registry.register(rule)

      self.current_rule = nil
    end

    def nothing
      nothing = Pattern::Nothing.build

      current_rule << nothing
    end

    def assure_current_rule
      if not current_rule?
        raise StateError, "No current rule"
      end
    end

    def current_rule?
      !current_rule.nil?
    end
  end
end
