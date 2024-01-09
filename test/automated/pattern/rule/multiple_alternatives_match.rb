require_relative '../../automated_init'

context "Rule Pattern" do
  context "Multiple Alternatives Match" do
    pattern = Controls::Pattern::Rule::MultipleAlternatives.example
    comment "Pattern:", pattern.source, quote: true

    text = Controls::Text.example
    comment "Text: #{text.inspect}"

    match = pattern.match(text)

    test! do
      refute(match.nil?)
    end

    test "Matches longest alternative" do
      assert(match.string == text)
    end
  end
end
