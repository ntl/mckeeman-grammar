require_relative '../../automated_init'

context "Match" do
  context "Pattern Matching" do
    context "Range" do
      range = 'a'..'z'

      items = [
        Controls::Match::Range.example(range, item: 'z'),
        'b'
      ]

      match = Controls::Match.example(items:)

      case match
      in text, 'b'
        matched = text == 'z'
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
