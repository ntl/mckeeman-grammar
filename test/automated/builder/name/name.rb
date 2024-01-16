require_relative "../../automated_init"

context "Builder" do
  context "Rule Name" do
    context "No Current Alternative" do
      builder = Controls::Builder::New.example

      rule_name = Controls::RuleName.example

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.name(rule_name)
        end
      end
    end
  end
end
