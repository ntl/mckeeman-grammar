require_relative "../automated_init"

context "Match" do
  context "Nothing" do
    match = Match.nothing

    context "Rule Name" do
      rule_name = match.rule_name

      comment rule_name.inspect

      test "Not set" do
        assert(rule_name.nil?)
      end
    end

    context "String" do
      string = match.string

      comment string.inspect

      test "Empty" do
        assert(string.empty?)
      end
    end
  end
end
