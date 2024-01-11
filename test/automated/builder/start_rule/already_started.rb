require_relative "../../automated_init"

context "Builder" do
  context "Start Rule" do
    context "Rule Is Already Started" do
      builder = Builder.new

      rule = Controls::Rule.example
      builder.current_rule = rule

      rule_name = Controls::RuleName.example

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.start_rule(rule_name)
        end
      end
    end
  end
end
