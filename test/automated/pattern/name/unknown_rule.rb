require_relative "../../automated_init"

context "Name Pattern" do
  context "Unknown Rule" do
    pattern = Controls::Pattern::Name::UnknownRule.example
    comment "Pattern:", pattern.source, quote: true

    text = Controls::Text.example
    comment "Text: #{text.inspect}"

    test "Is an error" do
      assert_raises(Pattern::Name::UnknownRuleError) do
        pattern.match(text)
      end
    end
  end
end
