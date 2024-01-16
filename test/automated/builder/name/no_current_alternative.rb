require_relative "../../automated_init"

context "Builder" do
  context "Rule Name" do
    builder = Controls::Builder::Alternative.example

    control_rule_name = Controls::RuleName.example
    builder.name(control_rule_name)

    context "Current Alternative" do
      alternative = builder.current_alternative

      context "Item Patterns" do
        item_patterns = alternative.item_patterns

	pattern = item_patterns.last

	test! "Added" do
	  refute(pattern.nil?)
	end

        context "Rule Name" do
          rule_name = pattern.rule_name
          comment rule_name.inspect

          detail "Control: #{control_rule_name.inspect}"

          test do
            assert(rule_name == control_rule_name)
          end
        end

        context "Rule Registry" do
          rule_registry = pattern.rule_registry
          comment rule_registry.inspect

          control_rule_registry = builder.rule_registry
          detail "Control: #{control_rule_registry.inspect}"

          test do
            assert(rule_registry.equal?(control_rule_registry))
          end
        end
      end
    end
  end
end
