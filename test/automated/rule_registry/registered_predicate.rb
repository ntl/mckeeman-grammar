require_relative "../automated_init"

context "Rule Registry" do
  context "Regsitered Predicate" do
    rule_registry = RuleRegistry.new

    context "Registered" do
      rule_name = Controls::RuleName.example
      rule = Controls::Rule.example(rule_name:)

      rule_registry.rules[rule_name] = rule

      context "By Rule Name" do
        registered = rule_registry.registered?(rule_name)

        test do
          assert(registered)
        end
      end

      context "By Rule" do
        registered = rule_registry.registered?(rule)

        test do
          assert(registered)
        end
      end
    end

    context "Not Registered" do
      rule_name = Controls::RuleName.random
      rule = Controls::Rule.example(rule_name:)

      context "By Rule Name" do
        registered = rule_registry.registered?(rule_name)

        test do
          refute(registered)
        end
      end

      context "By Rule" do
        registered = rule_registry.registered?(rule)

        test do
          refute(registered)
        end
      end
    end
  end
end
