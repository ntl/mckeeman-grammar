require_relative '../../automated_init'

context "Pattern" do
  context "Coerce" do
    context "Symbol" do
      control_rule_name = Controls::Pattern::Name.rule_name

      control_rules = Hash.new

      symbol = control_rule_name
      pattern = Pattern(symbol, rules: control_rules)

      comment pattern.inspect

      test! "Name pattern" do
        assert(pattern.instance_of?(Pattern::Name))
      end

      context "Rule Name" do
        rule_name = pattern.rule_name
        comment rule_name.inspect

        detail "Control: #{control_rule_name.inspect}"

        test do
          assert(rule_name == control_rule_name)
        end
      end

      context "Rules" do
        rules = pattern.rules
        comment rules.inspect

        detail "Control: #{control_rules.inspect}"

        test do
          assert(rules == control_rules)
        end
      end
    end
  end
end
