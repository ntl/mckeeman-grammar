require_relative "../../automated_init"

context "Builder" do
  context "Start Rule" do
    builder = Builder.new

    control_rule_name = Controls::RuleName.example

    builder.start_rule(control_rule_name)

    context "Current Rule" do
      current_rule = builder.current_rule

      test! "Set" do
        refute(current_rule.nil?)
      end

      context "Rule Name" do
        rule_name = current_rule.rule_name
        comment rule_name.inspect

        detail "Control: #{control_rule_name.inspect}"

        test do
          assert(rule_name == control_rule_name)
        end
      end
    end
  end
end
