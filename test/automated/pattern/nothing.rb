require_relative '../automated_init'

context "Pattern" do
  context "Nothing" do
    pattern = Pattern::Nothing.build
    comment "Pattern:", pattern.source, quote: true

    text = Controls::Text.example
    comment "Text: #{text.inspect}"

    match = pattern.match(text)

    test! "Match" do
      refute(match.nil?)
    end

    context "Rule Name" do
      rule_name = match.rule_name

      test "Not set" do
        assert(rule_name.nil?)
      end
    end

    context "String" do
      string = match.string
      comment string.inspect

      control_string = ""
      detail "Control: #{control_string.inspect}"

      test do
        assert(string == control_string)
      end
    end
  end
end
