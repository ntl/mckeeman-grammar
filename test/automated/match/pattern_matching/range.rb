require_relative "../../automated_init"

context "Match" do
  context "Pattern Matching" do
    context "Range" do
      range = "a".."z"

      segments = [
        Controls::Match::Range.example(range, segment: "z"),
        "b"
      ]

      match = Controls::Match.example(segments:)

      case match
      in string, "b"
        matched = string == "z"
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
