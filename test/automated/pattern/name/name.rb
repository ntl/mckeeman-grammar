require_relative "../../automated_init"

context "Name Pattern" do
  pattern = Controls::Pattern::Name.example
  comment "Pattern:", pattern.source, quote: true

  context "Text Matches" do
    control_string = Controls::Text.example

    text = "#{control_string}-some-more-text"
    comment "Text: #{text.inspect}"

    characters = text.split("-").first

    match = pattern.match(text)

    test! do
      refute(match.nil?)
    end

    context "Match" do
      context "Rule Name" do
        rule_name = match.rule_name
        comment rule_name.inspect

        control_rule_name = Controls::Pattern::Rule.rule_name
        detail "Control: #{control_rule_name.inspect}"

        test do
          assert(rule_name == control_rule_name)
        end
      end

      context "String" do
        string = match.string
        comment string.inspect

        detail "Control: #{control_string.inspect}"

        test do
          assert(string == control_string)
        end
      end
    end
  end

  context "Text Doesn't Match" do
    text = Controls::Text.random
    comment "Text: #{text.inspect}"

    match = pattern.match(text)

    test "No match" do
      assert(match.nil?)
    end
  end
end
