require_relative "../automated_init"

context "Match" do
  context "Build" do
    segments = ["some", "-", "segments"]

    context "Optional Rule Name Given" do
      control_rule_name = Controls::RuleName.example

      match = Match.build(*segments, rule_name: control_rule_name)

      context "Rule Name" do
        rule_name = match.rule_name

        test do
          assert(rule_name == control_rule_name)
        end
      end
    end

    context "Optional Rule Name Omitted" do
      match = Match.build(*segments)

      context "Rule Name" do
        rule_name = match.rule_name

        test "Not set" do
          assert(rule_name.nil?)
        end
      end
    end
  end
end
