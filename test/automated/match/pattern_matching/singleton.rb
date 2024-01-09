require_relative "../../automated_init"

context "Match" do
  context "Pattern Matching" do
    context "Singleton" do
      segments = [
        Controls::Match::Singleton.example("a"),
        "b"
      ]

      match = Controls::Match.example(segments:)

      case match
      in "a", "b"
        matched = true
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
