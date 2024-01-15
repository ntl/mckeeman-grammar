module McKeemanGrammar
  class Builder
    StateError = Class.new(RuntimeError)

    attr_accessor :current_rule
    attr_accessor :current_alternative

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

    def start_alternative
      if current_alternative?
        ## Message
        raise StateError
      end

      assure_current_rule

      alternative = Pattern::Alternative.new
      self.current_alternative = alternative

      current_rule << alternative
    end

    def finish_alternative
      assure_current_alternative

      self.current_alternative = nil
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

    def assure_current_alternative
      if not current_alternative?
        raise StateError, "No current alternative"
      end
    end

    def current_rule?
      !current_rule.nil?
    end

    def current_alternative?
      !current_alternative.nil?
    end
  end
end
