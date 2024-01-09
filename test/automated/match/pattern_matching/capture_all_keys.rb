require_relative '../../automated_init'

context "Match" do
  context "Pattern Matching" do
    context "Match, Capture All Keys" do
      match = Controls::Match.example

      case match
      in rule:, some_rule:, string:, **keys
        matched = keys == { some_nested_rule: 'b' }
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
