require_relative "../../automated_init"

context "Builder" do
  context "Finish Rule" do
    context "Rule Registered" do
      builder = Builder.new

      rule = Controls::Rule.example
      builder.current_rule = rule

      builder.finish_rule

      context "Rule Registry" do
        rule_registry = builder.rule_registry

        registered = rule_registry.registered?(rule)

        test "Registered" do
          assert(registered)
        end
      end
    end
  end
end
