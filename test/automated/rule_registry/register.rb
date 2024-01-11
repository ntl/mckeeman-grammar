require_relative "../automated_init"

context "Rule Registry" do
  context "Regsiter" do
    rule = Controls::Rule.example

    rule_registry = RuleRegistry.new
    refute(rule_registry.registered?(rule))

    rule_registry.register(rule)

    test "Registered" do
      assert(rule_registry.registered?(rule))
    end

    context "Rule Name Is Already Registered" do
      test "Is an error" do
        assert_raises(RuleRegistry::Error) do
          rule_registry.register(rule)
        end
      end
    end
  end
end
