require_relative "../automated_init"

context "Rule Registry" do
  context "Get Rule" do
    control_rule = Controls::RuleRegistry.rule

    rule_registry = Controls::RuleRegistry.example(control_rule)

    context "Rule Registered" do
      rule_name = control_rule.rule_name

      rule = rule_registry.get(rule_name)

      retrieved = rule.equal?(control_rule)

      test "Retrieved" do
        assert(retrieved)
      end
    end

    context "Rule Not Registered" do
      rule_name = Controls::RuleName.random

      rule = rule_registry.get(rule_name)

      test "Nothing retrieved" do
        assert(rule.nil?)
      end
    end
  end
end
