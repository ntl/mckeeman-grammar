require_relative '../automated_init'

context "Character Literal Pattern" do
  pattern = Controls::Pattern::CharacterLiteral.example
  comment "Pattern:", pattern.source, quote: true

  context "Text Matches" do
    text = Controls::Text.example
    comment "Text: #{text.inspect}"

    characters = text.split("-").first

    match = pattern.match(text)

    test! do
      refute(match.nil?)
    end

    context "Match" do
      context "Rule Name" do
        rule_name = match.rule_name

        test "Not set" do
          assert(rule_name.nil?)
        end
      end

      context "String" do
        string = match.string
        comment string.inspect

        control_string = characters
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
